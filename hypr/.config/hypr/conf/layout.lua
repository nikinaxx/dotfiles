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
        fullscreen_on_one_column = true,
        column_width = 0.5,
        focus_fit_method = 1,
        follow_focus = true,
        follow_min_visible = 0.4,
        explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
        wrap_focus = false,
        wrap_swapcol = false,
        direction = "right",
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
