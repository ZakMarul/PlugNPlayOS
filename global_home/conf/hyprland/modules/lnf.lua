-- Look and feel
-- Wiki link: https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 8,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(a6da95ff)", "rgba(8aadf4ff)"}, angle = 22.5 },
            inactive_border = "rgba(00000000)",
        },

        resize_on_border = false,

        allow_tearing = false,

    },

    decoration = {
        rounding       = 0,
        rounding_power = 0,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 16,
            passes    = 3,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
