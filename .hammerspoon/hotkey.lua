hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)

hs.hotkey.bind({ "cmd", "alt" }, "E", function()
  hs.eventtap.keyStrokes(EMAIL)
end)
