--    __  _____  _____      __  ____  ____
--   /  |/  / / / / / | /| / / / __ \/ __/
--  / /|_/ / /_/_  _/ |/ |/ / / /_/ /\ \  
-- /_/  /_/____//_/ |__/|__/  \____/___/
--   
-- Advanced configuration for Hyprland

-- FUNCTIONS
require("conf.functions")

-- MONITORS
require("monitors")
require("conf.monitor")

-- INPUT
require("conf.input")

-- GESTURE
require("conf.gestures")

-- AUTOSTART
require("conf.autostart")

-- COLORS
require("colors")

-- CONFIGURATION
-- Look variants are picked in conf/variants.lua
local variant = require("conf.variants")
require("conf.environment")
require("conf.windows." .. variant.windows)
require("conf.decorations." .. variant.decorations)
require("conf.layout")
require("conf.misc")
require("conf.keybinding")
require("conf.windowrule")
require("conf.animations." .. variant.animations)
require("conf.ml4w")

-- PLUGINS
require("conf.plugins.scrolloverview")

-- CUSTOM
local f = io.open(os.getenv("HOME") .. "/.config/hypr/custom.lua", "r")
if f then
    f:close()
    require("custom")
end

-- HYPRMOD
require("hyprland-gui")
