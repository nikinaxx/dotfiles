-- -----------------------------------------------------
-- Layouts & System Settings
-- -----------------------------------------------------

hl.config({
    general = {
        layout = "scrolling",
    },

    dwindle = {
	-- split right side only
	force_split = 2,
	-- dont change splits on resize
        preserve_split = true,
	-- split based on cursor position
	smart_split = false,
	-- default split ratio
	default_split_ratio = 1.0,
	-- determinescale for windows in special workspaces
	special_scale_factor = 0.9,
    },

    scrolling = {
        direction = "right",
        column_width = 0.7,
        follow_focus = true,
        fullscreen_on_one_column = true,
    },
    
    -- Master layout is handled here if needed
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
