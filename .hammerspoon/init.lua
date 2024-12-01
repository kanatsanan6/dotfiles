local hs = hs

hs.window.animationDuration = 0
hs.alert.show("Config loaded")

require("env") -- env must be loaded first
require("hotkey")
require("modifier")
require("shortcut")
require("vpn")
