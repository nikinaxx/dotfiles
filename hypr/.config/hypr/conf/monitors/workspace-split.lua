-------------------------------------------------------
-- Monitor Setup
-- name: "Workspace Split"
-------------------------------------------------------

local function map_workspaces(start_id, end_id, monitor_name)
    for i = start_id, end_id do
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = monitor_name
        })
    end
end

--map_workspaces(6, 5, "DP-2")
--map_workspaces(6, 10, "DP-7")
--

local laptop = "desc:AU Optronics 0xD49C"
local middle = "desc:Dell Inc. DELL S2722DC 6NSGHD3"
local right  = "desc:Dell Inc. DELL S2721DS 5LWPQ43"

hl.workspace_rule({workspace = "1",  monitor = laptop, persistent = true, default_name = "Comms" })
hl.workspace_rule({workspace = "2",  monitor = middle,  persistent = true, default_name = "Research", default = true })
hl.workspace_rule({workspace = "3",  monitor = right,  persistent = true, default_name = "Code" })
hl.workspace_rule({workspace = "4",  monitor = right,  persistent = false, default_name = "Terminal" })
