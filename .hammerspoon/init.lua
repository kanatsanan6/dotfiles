local hs = hs

hs.window.animationDuration = 0

-- https://github.com/asmagill/hs._asm.undocumented.spaces
local spaces = require "hs.spaces"
local screen = require "hs.screen"

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

-- Switch alacritty
hs.hotkey.bind({ 'command' }, '\\', function()
  local APP_NAME = 'Alacritty'
  function moveWindow(alacritty, space)
    -- move to main space
    local win = nil
    while win == nil do
      win = alacritty:mainWindow()
    end
    print("win = ", win)
    print("space = ", space)
    print("win:screen() = ", win:screen())
    local fullScreen = not win:isStandard()
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, alacritty)
    end
    winFrame = win:frame()
    scrFrame = screen.primaryScreen():frame()
    print(winFrame)
    print(scrFrame)
    winFrame.w = scrFrame.w
    winFrame.y = scrFrame.y
    winFrame.x = scrFrame.x
    print(winFrame)
    win:setFrame(winFrame, 0)
    print(win:frame())
    spaces.moveWindowToSpace(win, space)
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, alacritty)
    end
    win:focus()
  end

  local alacritty = hs.application.get(APP_NAME)
  if alacritty ~= nil and alacritty:isFrontmost() then
    alacritty:hide()
  else
    local space = spaces.activeSpaceOnScreen(screen.primaryScreen())
    print("activeSpace() = ", space)
    if alacritty == nil and hs.application.launchOrFocus(APP_NAME) then
      local appWatcher = nil
      print('create app watcher')
      appWatcher = hs.application.watcher.new(function(name, event, app)
        print(name)
        print(event)
        if event == hs.application.watcher.launched and name == APP_NAME then
          app:hide()
          moveWindow(app, space)
          appWatcher:stop()
        end
      end)
      print('start watcher')
      appWatcher:start()
    end
    if alacritty ~= nil then
      moveWindow(alacritty, space)
    end
  end
end)

function typeText(text)
  hs.eventtap.keyStrokes(text)
end

-- Register a hotkey to trigger typing text
hs.hotkey.bind({ "cmd", "alt" }, "E", function()
  typeText("kanasanan.j@mycloudfulfillment.com")
end)

-- Switch firefox
hs.hotkey.bind({ 'command' }, ']', function()
  local APP_NAME = 'Firefox Developer Edition'
  function moveWindow(firefox, space)
    -- move to main space
    local win = nil
    while win == nil do
      win = firefox:mainWindow()
    end
    print("win = ", win)
    print("space = ", space)
    print("win:screen() = ", win:screen())
    local fullScreen = not win:isStandard()
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, firefox)
    end
    winFrame = win:frame()
    scrFrame = screen.primaryScreen():frame()
    print(winFrame)
    print(scrFrame)
    winFrame.w = scrFrame.w
    winFrame.y = scrFrame.y
    winFrame.x = scrFrame.x
    print(winFrame)
    win:setFrame(winFrame, 0)
    print(win:frame())
    spaces.moveWindowToSpace(win, space)
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, firefox)
    end
    win:focus()
  end

  local firefox = hs.application.get(APP_NAME)
  if firefox ~= nil and firefox:isFrontmost() then
    firefox:hide()
  else
    local space = spaces.activeSpaceOnScreen(screen.primaryScreen())
    print("activeSpace() = ", space)
    if firefox == nil and hs.application.launchOrFocus(APP_NAME) then
      local appWatcher = nil
      print('create app watcher')
      appWatcher = hs.application.watcher.new(function(name, event, app)
        print(name)
        print(event)
        if event == hs.application.watcher.launched and name == APP_NAME then
          app:hide()
          moveWindow(app, space)
          appWatcher:stop()
        end
      end)
      print('start watcher')
      appWatcher:start()
    end
    if firefox ~= nil then
      moveWindow(firefox, space)
    end
  end
end)
