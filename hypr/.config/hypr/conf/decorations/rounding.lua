-- -----------------------------------------------------
-- General window decoration
-- name: "Rounding"
-- -----------------------------------------------------

hl.config({
    decoration = {
        rounding = 8,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 32,
            render_power = 2,
            color = "rgba(66000000)",
        },

        blur = {
            enabled   = true,
            size      = 7,
            passes    = 3,
            ignore_opacity = true,

            noise = 0.08,
            contrast = 1.5,
            vibrancy  = 0.1696,

            xray = false,
            new_optimizations = true,
        },
    },
})
