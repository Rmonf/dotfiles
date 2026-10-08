-------------
-- WINDOWS --
-------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/



-- Set obsidian's configuration window as a floating window
hl.window_rule({
	name = "obsidian_floating_config",
	match = {
		class	= "md.obsidian.Obsidian",
		title	= ".*(Settings|Community themes).*"
		},
	float = true,
})

-- Set vivaldi's config window as a floating window
hl.window_rule({
        name = "vivaldi_config_floating",
        match = {
                class   = "vivaldi-stable",
                title   = ".*Settings.*"
                },
        float = true,
})

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)


hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- No animations rule
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)


-- Noctalia Settings --
-----------------------
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})


----------------
-- WORKSPACES --
----------------

-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule({ workspace = "1", monitor = "DP-1", persistent = true, default_name = "one" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1", persistent = true, default_name = "two" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1", persistent = true, default_name = "three" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1", persistent = true, default_name = "four" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1", persistent = true, default_name = "five" })
hl.workspace_rule({ workspace = "6", monitor = "DP-1", persistent = true, default_name = "six" })



-----------------
-- LAYER RULES --
-----------------

-- Noctalia specific
hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,		-- Disable hyprland anims to favor noctalia's own
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

---------------------
-- LAYOUT-SPECIFIC --
--------------------- 

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})
