local hs = hs
local env = require("env")
local func = require("function")

hs.window.animationDuration = 0
hs.alert.show("Config loaded")
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)

hs.hotkey.bind({ "cmd", "alt" }, "E", function()
  hs.eventtap.keyStrokes(env.email)
end)

local modifiers = { "cmd", "shift" }

-- App shortcuts
hs.hotkey.bind(modifiers, '1', function() func.openApp('Google Chrome') end)
hs.hotkey.bind(modifiers, '2', function() func.openApp('Alacritty') end)
hs.hotkey.bind(modifiers, '3', function() func.openApp('Slack') end)

-- Site shortcuts
hs.hotkey.bind(modifiers, 'j', function() func.openUrl(env.jira_url) end)
hs.hotkey.bind(modifiers, 'g', function() func.openUrl(env.pr_url) end)
hs.hotkey.bind(modifiers, 'i', function() func.openUrl(env.inbox_url) end)
hs.hotkey.bind(modifiers, 'c', function() func.openUrl(env.calendar_url) end)
