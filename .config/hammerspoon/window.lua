-- define window movement hotkeys

hs.fnutils.each({
  { key = 'g', fn = hs.grid.pushWindowNextScreen                         },
  { key = 'p', fn = hs.grid.pushWindowPrevScreen                         },
  { key = '\'', fn = hs.window.filter.focusEast                         },
  { key = ';', fn = hs.window.filter.focusWest                         },
  { key = '9', fn = hs.window.filter.focusNorth                         },
  { key = '/', fn = hs.window.filter.focusSouth                         },
  { key = 'left', fn = hs.grid.pushWindowLeft                               },
  { key = 'right', fn = hs.grid.pushWindowRight                              },
  { key = 'up', fn = hs.grid.pushWindowUp                                 },
  { key = 'down', fn = hs.grid.pushWindowDown                               },
  { key = '[', fn = hs.grid.resizeWindowThinner                          },
  { key = ']', fn = hs.grid.resizeWindowWider                            },
  { key = '=', fn = hs.grid.resizeWindowTaller                           },
  { key = '-', fn = hs.grid.resizeWindowShorter                          },
}, function(object)
  hs.hotkey.bind(HYPER, object.key, function() doWin(object.fn, object.args) end)
end)

-- set grid size and snap to grid hotkeys
hs.grid.setGrid('4x4').setMargins({ x = 1.5, y = 1.5 })
hs.fnutils.each({
  { key = '7', geom = { x = 1.125, y = 0, w = 1.125, h = 4 }},
  { key = '6', geom = { x = 0, y = 0, w = 1.125, h = 4 }},
  { key = '8', geom = { x = 2.25, y = 0, w = 1.75, h = 4 }},
  { key = '3', geom = { x = 2.6, y = 0, w = 1.3, h = 4 }},
  { key = '2', geom = { x = 1.3, y = 0, w = 1.3, h = 4 }},
  { key = '1', geom = { x = 0, y = 0, w = 1.3, h = 4 }},
  { key = '5', geom = { x = 2, y = 0, w = 2, h = 4 }},
  { key = '6', geom = { x = 0, y = 0, w = 2, h = 4 }},
}, function(object)
  hs.hotkey.bind(HYPER, object.key, function()  doWin(hs.grid.set, object.geom) end)
end)

-- launch and focus applications
hs.fnutils.each({
  { key = 's', apps = { 'Google Chrome', 'Safari' } },
  { key = 'a', apps = { 'Finder'  } },
  { key = 'o', apps = { 'Obsidian'     } },
  { key = 'c', apps = { 'Calendar', 'Reminders'     } },
  { key = 'e', apps = { 'Code'              } },
  { key = 'u', apps = { 'UTM'              } },
  { key = 't', apps = { 'iTerm'     } },
}, function(object)
  hs.hotkey.bind(HYPER, object.key, function() smartLaunchOrFocus(object.apps) end)
end)

--###############################################################################################
--###############################################################################################
--UTILS
--###############################################################################################
--###############################################################################################
function doWin(fn, options)
  local win = hs.window.focusedWindow()
  if win then
    fn(win, options, win:screen())
  else
    hs.alert.show("No focused window.")
  end
end
--
-- function smartLaunchOrFocus(apps)
--   local app = hs.application.frontmostApplication()
--   local appName = app:name()
--   local appPath = app:path()
--   local appIsRunning = false
--   for key, val in pairs(apps) do
--     print(key, val)
--   end
--   for i, name in ipairs(apps) do
--     if appName == name then
--       appIsRunning = true
--       break
--     end
--   end
--   if appIsRunning then
--     hs.application.launchOrFocus(appPath)
--   else
--     hs.application.launchOrFocus(apps[1])
--   end
-- end

function forceLaunchOrFocus(appName)
  -- first focus with hammerspoon
  hs.application.launchOrFocus(appName)

  -- clear timer if exists
  if ext.cache.launchTimer then ext.cache.launchTimer:stop() end

  -- wait 500ms for window to appear and try hard to show the window
  ext.cache.launchTimer = hs.timer.doAfter(0.5, function()
    local frontmostApp     = hs.application.frontmostApplication()
    local frontmostWindows = hs.fnutils.filter(frontmostApp:allWindows(), function(win) return win:isStandard() end)

    -- break if this app is not frontmost (when/why?)
    if frontmostApp:title() ~= appName then
      print('Expected app in front: ' .. appName .. ' got: ' .. frontmostApp:title())
      return
    end

    if #frontmostWindows == 0 then
      -- check if there's app name in window menu (Calendar, Messages, etc...)
      if frontmostApp:findMenuItem({ 'Window', appName }) then
        -- select it, usually moves to space with this window
        frontmostApp:selectMenuItem({ 'Window', appName })
      else
        -- otherwise send cmd-n to create new window
        hs.eventtap.keyStroke({ 'cmd' }, 'n')
      end
    end
  end)
end


-- smart app launch or focus or cycle windows
function smartLaunchOrFocus(launchApps)
  local frontmostWindow = hs.window.frontmostWindow()
  local runningApps     = hs.application.runningApplications()
  local runningWindows  = {}

  -- filter running applications by apps array
  local runningApps = hs.fnutils.map(launchApps, function(launchApp)
    return hs.application.get(launchApp)
  end)

  -- create table of sorted windows per application
  hs.fnutils.each(runningApps, function(runningApp)
    local standardWindows = hs.fnutils.filter(runningApp:allWindows(), function(win)
      return win:isStandard()
    end)

    -- sort by id, so windows don't jump randomly every time
    table.sort(standardWindows, function(a, b) return a:id() < b:id() end)

    -- concat with all running windows
    hs.fnutils.concat(runningWindows, standardWindows);
  end)

  if #runningApps == 0 then
    -- if no apps are running then launch first one in list
    forceLaunchOrFocus(launchApps[1])
  elseif #runningWindows == 0 then
    -- if some apps are running, but no windows - force create one
    forceLaunchOrFocus(runningApps[1]:title())
  else
    -- check if one of windows is already focused
    local currentIndex = hs.fnutils.indexOf(runningWindows, frontmostWindow)

    if not currentIndex then
      -- if none of them is selected focus the first one
      runningWindows[1]:focus()
    else
      -- otherwise cycle through all the windows
      local newIndex = currentIndex + 1
      if newIndex > #runningWindows then newIndex = 1 end

      runningWindows[newIndex]:focus()
    end
  end
end
