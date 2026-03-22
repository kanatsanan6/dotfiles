local env = require("env")
local func = require("function")
local hs = hs

hs.window.animationDuration = 0
hs.alert.show("Config loaded")

MODIFIER = { "cmd", "shift" }
ADV_MODIFINER = { "cmd", "shift", "options" }

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
	hs.reload()
end)

hs.hotkey.bind({ "cmd", "alt" }, "E", function()
	hs.eventtap.keyStrokes(env.EMAIL)
end)

hs.hotkey.bind({ "cmd", "shift" }, "'", function() func.resize() end)
hs.hotkey.bind({ "cmd", "shift" }, '1', function() func.openApp('Google Chrome') end)
hs.hotkey.bind({ "cmd", "shift" }, '2', function() func.openApp('Alacritty') end)
hs.hotkey.bind({ "cmd", "shift" }, '3', function() func.openApp('Slack') end)

hs.hotkey.bind({ "cmd", "shift" }, 'j', function() func.openUrl(env.JIRA_URL) end)
hs.hotkey.bind({ "cmd", "shift" }, 'g', function() func.openUrl(env.PR_URL) end)
hs.hotkey.bind({ "cmd", "shift" }, 'i', function() func.openUrl(env.INBOX_URL) end)
hs.hotkey.bind({ "cmd", "shift" }, 'c', function() func.openUrl(env.CALENDAR_URL) end)
hs.hotkey.bind({ "cmd", "shift" }, 'm', function() func.openUrl(env.METABASE) end)
hs.hotkey.bind({ "cmd", "shift", "options" }, 'g', function() func.openUrl(env.GITHUB_NOTI_URL) end)

hs.hotkey.bind({ "cmd", "shift" }, '=', function() func.toggleVPN(env.VPN_PROFILE) end)
