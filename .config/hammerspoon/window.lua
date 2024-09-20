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
hs.grid.setGrid('4x4').setMargins({ x = 2, y = 2 })
hs.fnutils.each({
  { key = '7', geom = { x = 1.125, y = 0, w = 1.125, h = 4 }},
  { key = '6', geom = { x = 0, y = 0, w = 1.125, h = 4 }},
  { key = '8', geom = { x = 2.25, y = 0, w = 1.75, h = 4 }},
  { key = '5', geom = { x = 3, y = 0, w = 1, h = 4 }},
  { key = '4', geom = { x = 1, y = 0, w = 2, h = 4 }},
  { key = '3', geom = { x = 0, y = 0, w = 1, h = 4 }},
  { key = '2', geom = { x = 2, y = 0, w = 2, h = 4 }},
  { key = '1', geom = { x = 0, y = 0, w = 2, h = 4 }},
}, function(object)
  hs.hotkey.bind(HYPER, object.key, function()  doWin(hs.grid.set, object.geom) end)
end)

-- launch and focus applications
hs.fnutils.each({
  { key = 's', apps = { 'Google Chrome', 'Safari' } },
  { key = 'a', apps = { 'Finder'  } },
  { key = 'y', apps = { 'Obsedin'     } },
  { key = 'c', apps = { 'Calendar'     } },
  { key = 'e', apps = { 'Code'              } },
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

function smartLaunchOrFocus(apps)
  local app = hs.application.frontmostApplication()
  local appName = app:name()
  local appPath = app:path()
  local appIsRunning = false
  for i, name in ipairs(apps) do
    if appName == name then
      appIsRunning = true
      break
    end
  end
  if appIsRunning then
    hs.application.launchOrFocus(appPath)
  else
    hs.application.launchOrFocus(apps[1])
  end
end
