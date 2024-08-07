local hs = hs

hs.window.animationDuration = 0

local modifiers = { "cmd", "shift" }
local spaces = require "hs.spaces"
local screen = require "hs.screen"

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind(modifiers, '1', function() hs.application.launchOrFocus('Google Chrome') end)
hs.hotkey.bind(modifiers, '2', function() hs.application.launchOrFocus('Alacritty') end)
hs.hotkey.bind(modifiers, '3', function() hs.application.launchOrFocus('Slack') end)
hs.hotkey.bind(modifiers, '4', function() hs.application.launchOrFocus('Finder') end)
