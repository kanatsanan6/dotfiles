local M = {}

local hs = hs

M.openApp = function(appName)
  return hs.application.launchOrFocus(appName)
end

M.openUrl = function(url)
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

M.resize = function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local maxFrame = screen:frame()

  local newHeight = maxFrame.h
  local newWidth = newHeight * (16 / 9)

  local newX = maxFrame.x + (maxFrame.w - newWidth) / 2
  local newY = maxFrame.y

  win:setFrame(hs.geometry.rect(newX, newY, newWidth, newHeight))
end

M.toggleVPN = function(name)
  return hs.osascript.applescript([[
    tell application "Tunnelblick"
      get state of first configuration where name = "]] .. name .. [["

      if result is not "CONNECTED" then
        connect "]] .. name .. [["
      else
        disconnect "]] .. name .. [["
        quit
      end if
    end tell
  ]])
end

return M
