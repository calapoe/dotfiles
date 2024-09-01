-- Setup in karabiner to right_shift.
HYPER = {'ctrl', 'shift', 'alt', 'cmd'}
CCS = {'ctrl', 'shift', 'cmd'}




hs.loadSpoon("SpoonInstall")
Install=spoon.SpoonInstall

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
        ["iTerm2"]        = {HYPER, "t"},
        [{"Safari",
        "Chromium"}]       = {HYPER, "s"},
        [{"O", "o"}]       = {HYPER, "o"},
        [{"Code"}]       = {HYPER, "e"},
        [{"Finder"}]       = {HYPER, "a"},
        [{"Obsidian"}]     = {HYPER, "n"},
    }})

Install:andUse("AppLauncher", {
    config = {
        modifiers = HYPER,
    },
    hotkeys = {
        z = "Zoom.us",
        t = "iTerm2",
        c = "Calendar",
    }
})

Install:andUse("WindowGrid", {
    config = {
        gridGeometries = hs.grid.setGrid('4x1'),
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

