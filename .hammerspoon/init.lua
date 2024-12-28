local hs = hs

hs.window.animationDuration = 0
hs.alert.show("Config loaded")

require("env") -- env must be loaded first
require("modifier")
require("hotkey")
require("shortcut")
require("vpn")
