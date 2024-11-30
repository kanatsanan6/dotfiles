local module = {}

module.openApp = function(appName)
  hs.application.launchOrFocus(appName)
end

module.openUrl = function(url)
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

return module
