local function openApp(appName)
  return hs.application.launchOrFocus(appName)
end

local function openUrl(url)
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
--
-- App shortcuts
hs.hotkey.bind(MODIFIER, '1', function() openApp('Google Chrome') end)
hs.hotkey.bind(MODIFIER, '2', function() openApp('Alacritty') end)
hs.hotkey.bind(MODIFIER, '3', function() openApp('Slack') end)

-- Site shortcuMODIFIER
hs.hotkey.bind(MODIFIER, 'j', function() openUrl(JIRA_URL) end)
hs.hotkey.bind(MODIFIER, 'g', function() openUrl(PR_URL) end)
hs.hotkey.bind(MODIFIER, 'i', function() openUrl(INBOX_URL) end)
hs.hotkey.bind(MODIFIER, 'c', function() openUrl(CALENDAR_URL) end)
