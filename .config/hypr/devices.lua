------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@165",
    position = "0x0",
    scale    = "auto",
})


---------------
---- INPUT ----
---------------

-- Generic settings
hl.config({
    input = {
	-- Keyboard Settings
        kb_layout  = "es",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
	
	-- Mouse Settings
        follow_mouse = 1,	
        sensitivity = -0.75, 		-- -1.0 - 1.0, 0 means no modification.
	accel_profile="flat",

	-- Touchpad Settings
        touchpad = {
            natural_scroll = false,
        },
    },
})
-- Touchpad actions
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
