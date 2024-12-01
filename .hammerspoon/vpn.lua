local function toggleVPN(name)
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

hs.hotkey.bind(MODIFIER, '=', function() toggleVPN("toon") end)
