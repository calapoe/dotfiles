-- Setup in karabiner to right_shift.
HYPER = {'ctrl', 'shift', 'alt', 'cmd'}
CCS = {'ctrl', 'shift', 'cmd'}

hs.loadSpoon("SpoonInstall")
local Install=spoon.SpoonInstall

Install:andUse("ReloadConfiguration", {
    start = true,
    hotkeys = {
        reloadConfiguration = {HYPER, "r"}
    }})

dofile("window.lua")
