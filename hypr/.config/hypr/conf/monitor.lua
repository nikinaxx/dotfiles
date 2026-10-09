-------------------------------------------------------
-- Monitor Setup
-- name: "Workspace Split"
-------------------------------------------------------

local laptop = "desc:AU Optronics 0xD49C"
local left = "desc:Dell Inc. DELL S2722DC 6NSGHD3"
local right  = "desc:Dell Inc. DELL S2721DS 5LWPQ43"

-- laptop panel is on only when no external monitor is connected
local function set_laptop(enabled)
    hl.monitor({
        output = laptop,
        mode = "1920x1200@60.01",
        position = "auto",
        scale = 1.5,
        disabled = not enabled,
    })
end

local function docked()
    return hl.get_monitor(left) ~= nil or hl.get_monitor(right) ~= nil
end

-- toggling the laptop panel fires added/removed for the panel itself,
-- so those events must be ignored or the handlers re-trigger each other
local function is_laptop(m)
    return "desc:" .. m.description == laptop
end

-- applied on every config load/reload
set_laptop(not docked())
-- dock plugged in: turn the laptop panel off
hl.on("monitor.added", function(m)
    if not is_laptop(m) then
        set_laptop(false)
    end
end)
-- dock unplugged: turn the laptop panel back on once both externals are gone
hl.on("monitor.removed", function(m)
    if is_laptop(m) then
        return
    end
    local other = ("desc:" .. m.description == left) and right or left
    if hl.get_monitor(other) == nil then
        set_laptop(true)
    end
end)

hl.workspace_rule({workspace = "1",  monitor = right, persistent = true, default_name = "Code" })
hl.workspace_rule({workspace = "2",  monitor = left, persistent = true, default_name = "Research" })
hl.workspace_rule({workspace = "3",  monitor = left, persistent = true, default_name = "Notes" })
hl.workspace_rule({workspace = "4",  monitor = left, persistent = true, default_name = "Work" })
hl.workspace_rule({workspace = "5",  monitor = left, persistent = true, default_name = "Private" })
