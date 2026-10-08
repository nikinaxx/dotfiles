-- -----------------------------------------------------
-- Layouts & System Settings
-- -----------------------------------------------------

hl.config({
    general = {
        layout = "scrolling",
    },

    dwindle = {
        force_split = 2, -- split right side only
        preserve_split = true, -- dont change splits on resize
        smart_split = false, -- split based on cursor position
        default_split_ratio = 1.0, -- default split ratio
        special_scale_factor = 0.9, -- determinescale for windows in special workspaces
    },

    scrolling = {
        direction = "right",
        column_width = 0.7,
        follow_focus = true,
        fullscreen_on_one_column = true,
    },
    
    master = {
        -- new_status = "master" -- Commented out due to compatibility reasons
    },

    binds = {
        workspace_back_and_forth = false,
        allow_workspace_cycles = true,
        pass_mouse_when_bound = false,
        window_direction_monitor_fallback = false,
    },
})
