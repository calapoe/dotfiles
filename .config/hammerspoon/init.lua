
-- Setup in karabiner to right_shift.
HYPER = {'ctrl', 'shift', 'alt', 'cmd'}
CCS = {'ctrl', 'shift', 'cmd'}

local hs = hs
hs.loadSpoon("SpoonInstall")
local Install=spoon.SpoonInstall


Install:andUse("ReloadConfiguration", {
    start = true,
    hotkeys = {
        reloadConfiguration = {HYPER, "r"}
    }})

Install:andUse("ClipboardTool", {
    start = true,
    hotkeys = {
        toggle_clipboard = {HYPER, "p"},
    }})

Install:andUse("AppWindowSwitcher", {
    hotkeys = {
        ["iTerm"]        = {HYPER, "t"},
        [{"Safari",
        "Google Chrome"}]       = {HYPER, "s"},
        [{"O", "o"}]       = {HYPER, "o"},
        [{"Code"}]       = {HYPER, "e"},
        [{"Obsidian"}]     = {HYPER, "n"},
    }})

Install:andUse("AppLauncher", {
    config = {
        modifiers = HYPER,
    },
    hotkeys = {
        z = "Zoom.us",
        -- c = "Calendar",
        a = "Finder",
        m = "Mail",
    }
})

Install:andUse("WindowGrid", {
    config = {
        gridGeometries = hs.grid.setGrid('2x2'),
    },
    start = true,
    hotkeys = {
        show_grid = {HYPER, "g"},
    }})

Install:andUse("WindowHalfsAndThirds",{
    hotkeys = "default",
})

-- define window movement hotkeys
hs.fnutils.each({
  { key = 'z', fn = hs.grid.maximizeWindow                               },
  { key = 'g', fn = hs.grid.pushWindowNextScreen                         },
  { key = 'p', fn = hs.grid.pushWindowPrevScreen                         },
  { key = 'right', fn = hs.window.filter.focusEast                         },
  { key = 'left', fn = hs.window.filter.focusWest                         },
  { key = 'up', fn = hs.window.filter.focusNorth                         },
  { key = 'down', fn = hs.window.filter.focusSouth                         },
  { key = 'h', fn = hs.grid.pushWindowLeft                               },
  { key = 'l', fn = hs.grid.pushWindowRight                              },
  { key = 'k', fn = hs.grid.pushWindowUp                                 },
  { key = 'j', fn = hs.grid.pushWindowDown                               },
  { key = '[', fn = hs.grid.resizeWindowThinner                          },
  { key = ']', fn = hs.grid.resizeWindowWider                            },
  { key = '=', fn = hs.grid.resizeWindowTaller                           },
  { key = '-', fn = hs.grid.resizeWindowShorter                          },
}, function(object)
  hs.hotkey.bind(HYPER, object.key, function() object.fn(object.args) end)
end)

local winF = require("window")

-- Cycle through windows in 1
hs.hotkey.bind(HYPER, '1', function() 
    local geom = { x = 0, y = 0, w = 2, h = 2 }
    winF.cycleBehind(geom)
end)

-- Cycle through windows in 2 
hs.hotkey.bind(HYPER, '2', function() 
    local geom = { x = 2, y = 0, w = 2, h = 2 }
    winF.getWindowsBehind(geom)
end)

