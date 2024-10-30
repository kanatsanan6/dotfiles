local hs = hs

hs.window.animationDuration = 0

local modifiers = { "cmd", "shift" }
local env = require("env")

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

local function open(appName)
  hs.application.launchOrFocus(appName)
end

hs.hotkey.bind(modifiers, '1', function() open('Google Chrome') end)
hs.hotkey.bind(modifiers, '2', function() open('Alacritty') end)
hs.hotkey.bind(modifiers, '3', function() open('Alacritty') end)
hs.hotkey.bind(modifiers, '4', function() open('Slack') end)

function openUrl(url)
  return hs.osascript.javascript([[
    var gg = Application('Google Chrome');
    gg.activate();


    var exists = false
    for (win of gg.windows()) {
      var tabIndex =
        win.tabs().findIndex(function(tab) {
          return "]] .. url .. [[" == tab.url();
        });

      if (tabIndex != -1) {
        win.activeTabIndex = (tabIndex + 1);
        win.index = 1;
        exists = true
        break;
      }
    }

    if (!exists) {
      var window = gg.windows[0];
      var tab = gg.Tab({url: "]] .. url .. [["});

      window.tabs.push(tab);
    }
  ]])
end

hs.hotkey.bind({ "cmd", "alt" }, "E", function()
  hs.eventtap.keyStrokes("kanasanan.j@mycloudfulfillment.com")
end)

hs.hotkey.bind(modifiers, 'j', function() openUrl(env.jira_url) end)
hs.hotkey.bind(modifiers, 'g', function() openUrl(env.pr_url) end)
hs.hotkey.bind(modifiers, 'i', function() openUrl(env.inbox_url) end)
hs.hotkey.bind(modifiers, 'c', function() openUrl(env.calendar_url) end)
