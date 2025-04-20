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

  local newHeight = maxFrame.h
  local newWidth = newHeight * (16 / 9)

  local newX = maxFrame.x + (maxFrame.w - newWidth) / 2
  local newY = maxFrame.y

  win:setFrame(hs.geometry.rect(newX, newY, newWidth, newHeight))
end)

