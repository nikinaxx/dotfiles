-------------------------------------------------------
-- Monitor Setup
-- name: "Workspace Split"
-------------------------------------------------------

local laptop = "desc:AU Optronics 0xD49C"
local left = "desc:Dell Inc. DELL S2722DC 6NSGHD3"
local right  = "desc:Dell Inc. DELL S2721DS 5LWPQ43"

local function docked()
    return #hl.get_monitors() > 1
end
-- applied on every config load/reload
hl.monitor({ output = laptop, disabled = docked() })
-- applied when a monitor is connected or removed while running
hl.on("monitor.layout_changed", function()
    hl.exec_cmd('hyprctl keyword monitor "' .. laptop .. ',' .. (docked() and "disable" or "preferred,auto,1") .. '"')
end)

hl.workspace_rule({workspace = "1",  monitor = right,  persistent = true, default_name = "Code" })
hl.workspace_rule({workspace = "2",  monitor = left,  persistent = true, default_name = "Research" })
hl.workspace_rule({workspace = "3",  monitor = left, persistent = true, default_name = "Work" })
hl.workspace_rule({workspace = "4",  monitor = left, persistent = true, default_name = "Private" })
