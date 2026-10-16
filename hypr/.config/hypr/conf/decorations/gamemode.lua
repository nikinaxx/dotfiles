-- -----------------------------------------------------
-- General window decoration
-- name: "Gamemode"
-- -----------------------------------------------------

hl.config({
    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 0.95,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled = false
        },

        blur = {
            enabled   = false
        },
    },
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})