hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)

hs.hotkey.bind({ "cmd", "alt" }, "E", function()
  hs.eventtap.keyStrokes(EMAIL)
end)

hs.hotkey.bind(MODIFIER, "'", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local maxFrame = screen:frame()

  local newWidth = maxFrame.w * 0.65
  local newHeight = maxFrame.h
  local newX = maxFrame.x
  local newY = maxFrame.y

  win:setFrame(hs.geometry.rect(newX, newY, newWidth, newHeight))
end)
