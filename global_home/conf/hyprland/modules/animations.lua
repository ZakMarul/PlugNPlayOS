-----------------------
----- ANIMATIONS ------
-----------------------

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.config({ animations = { enabled = true } })

hl.curve("glide",  { type = "bezier", points = { {0.16, 0.84}, {0.24, 1} } })  -- soft ease-out
hl.curve("ease",   { type = "bezier", points = { {0.4,  0},    {0.2,  1} } })  -- eases in and out
hl.curve("smooth", { type = "bezier", points = { {0.25, 0.1},  {0.25, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("md3Decel", { type = "bezier", points = { {0.05, 0.7}, {0.1, 1.0} } })

hl.animation({ leaf = "global",           enabled = true,  speed = 3.6, bezier = "glide" })
hl.animation({ leaf = "windows",          enabled = true,  speed = 2.8, bezier = "glide" })
hl.animation({ leaf = "windowsIn",        enabled = true,  speed = 2.4, bezier = "glide",  style = "popin 87%" })
hl.animation({ leaf = "windowsOut",       enabled = true,  speed = 2.0, bezier = "smooth", style = "popin 87%" })
hl.animation({ leaf = "windowsMove",      enabled = true,  speed = 2.8, bezier = "ease" })
hl.animation({ leaf = "layers",           enabled = true,  speed = 3,   bezier = "glide" })
hl.animation({ leaf = "layersIn",         enabled = true,  speed = 2.8, bezier = "glide",  style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true,  speed = 1.9, bezier = "smooth", style = "fade" })
hl.animation({ leaf = "fade",             enabled = true,  speed = 2.4, bezier = "smooth" })
hl.animation({ leaf = "fadeOut",          enabled = true,  speed = 1.8, bezier = "smooth" })
hl.animation({ leaf = "border",           enabled = true,  speed = 3.2, bezier = "smooth" })
hl.animation({ leaf = "borderangle",      enabled = false })
hl.animation({ leaf = "workspaces",       enabled = true,  speed = 2.8, bezier = "md3Decel",   style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 0.8, bezier = "md3Decel", style = "slidevert" })
hl.animation({ leaf = "zoomFactor",       enabled = true,  speed = 4,   bezier = "glide" })
