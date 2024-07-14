local hs = hs

hs.window.animationDuration = 0

local spaces = require "hs.spaces"
local screen = require "hs.screen"

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

local function moveWindowToSpace(app, space)
  local win = nil
  while win == nil do
    win = app:mainWindow()
  end
  local fullScreen = not win:isStandard()
  if fullScreen then
    hs.eventtap.keyStroke('cmd', 'return', 0, app)
  end
  local winFrame = win:frame()
  local scrFrame = screen.primaryScreen():frame()
  winFrame.w = scrFrame.w
  winFrame.y = scrFrame.y
  winFrame.x = scrFrame.x
  win:setFrame(winFrame, 0)
  spaces.moveWindowToSpace(win, space)
  if fullScreen then
    hs.eventtap.keyStroke('cmd', 'return', 0, app)
  end
  win:focus()
end

local function openApp(appName)
  local app = hs.application.get(appName)
  if app ~= nil and app:isFrontmost() then
    -- Do nothing if the app is already frontmost
  else
    local space = spaces.activeSpaceOnScreen(screen.primaryScreen())
    if app == nil and hs.application.launchOrFocus(appName) then
      local appWatcher = hs.application.watcher.new(function(name, event, app)
        if event == hs.application.watcher.launched and name == appName then
          moveWindowToSpace(app, space)
          appWatcher:stop()
        end
      end)
      appWatcher:start()
    end
    if app ~= nil then
      moveWindowToSpace(app, space)
    end
  end
end

-- email shortcut
hs.hotkey.bind({ "cmd", "alt" }, "E", function()
  hs.eventtap.keyStrokes("kanasanan.j@mycloudfulfillment.com")
end)

hs.hotkey.bind({ 'cmd', 'shift' }, '1', function()
  openApp('Google Chrome')
end)

hs.hotkey.bind({ 'cmd', 'shift' }, '2', function()
  openApp('Alacritty')
end)

hs.hotkey.bind({ 'cmd', 'shift' }, '3', function()
  openApp('Slack')
end)

