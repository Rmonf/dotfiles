---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager_tui = "kitty --class yazi -e yazi"                -- Passing --class yazi makes it so this terminal window is treated as a unique type
local fileManager_gui = "uwsm app -- thunar"
local browser = "uwsm app -- vivaldi"
local notesapp = "uwsm app -- obsidian"
local ide = "uwsm app -- code"
---------------------
---- KEYBINDINGS ----
---------------------
-- See https://wiki.hypr.land/Configuring/Basics/Binds/ for more info


-- Assigned variables --
------------------------

local mainMod = "SUPER" 	-- Sets "Windows" key as main modifier



-- Control binds --
-------------------

-- Exit hyprland to a new login
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(mainMod .. " + C", hl.dsp.window.close())				-- Close Window (keyboard)
hl.bind(mainMod .. " + mouse:274", hl.dsp.window.close())			-- Close Window (mouse)
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))		-- Toggle floating window
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())				-- Toggle Pseudo-Tiling (Tiles stretch but app UI doesn't)

-- Toggle vertical split, dwindle mode only
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.layout("togglesplit"))

-- Fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen"}))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })



-- Noctalia components --
-------------------------

hl.bind("CTRL + " .. mainMod .. " + SPACE", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))	-- Launcher
hl.bind(mainMod .. "+ H", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))			-- Control center (Home)
hl.bind(mainMod .. "+ comma", hl.dsp.exec_cmd("noctalia msg settings-toggle"))				-- Settings
hl.bind("ALT + Tab", hl.dsp.exec_cmd("noctalia msg window-switcher hold"))				-- Window switcher
hl.bind(mainMod .. "+ B", hl.dsp.exec_cmd("noctalia msg bar-toggle topbar"))				-- Toggle default bar	

hl.bind(mainMod .. "+ SHIFT + S", hl.dsp.exec_cmd("noctalia msg screenshot-annotate"))

-- Multimedia keys for volume and LCD brightness --
---------------------------------------------------

hl.bind("XF86AudioPlay", 	hl.dsp.exec_cmd("playerctl play-pause"))		-- Play/Pause current media player via headset button
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })



-- App binds --
---------------

hl.bind(mainMod .. " + Q", 		hl.dsp.exec_cmd(terminal))		-- Open the terminal 			(kitty)
hl.bind(mainMod .. " + A", 		hl.dsp.exec_cmd(fileManager_tui))	-- Open the default file explorer 	(yazi)
hl.bind(mainMod .. " + SHIFT + A", 	hl.dsp.exec_cmd(fileManager_gui)) 	-- Open the GUI file manager 		(thunar via uwsm)
hl.bind(mainMod .. " + W", 		hl.dsp.exec_cmd(browser))		-- Open the default browser 		(vivaldi via uwsm)
hl.bind(mainMod .. " + D", 		hl.dsp.exec_cmd("uwsm app -- discord"))	-- Open Discord via uwsm
hl.bind(mainMod .. " + SHIFT + E", 	hl.dsp.exec_cmd(notesapp))		-- Open the default notes app 		(obsidian via uwsm)
hl.bind(mainMod .. " + E",		hl.dsp.exec_cmd(ide))			-- Open the default ide 		(code via uwsm)


-- Workspace binds --
---------------------

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))		-- Switch workspaces with mainMod + [0-9]
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))		-- Move active window to a workspace with mainMod + SHIFT + [0-9]		
end

-- Scroll through all workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + mouse_down",   hl.dsp.focus({ workspace = "+1" }))

-- Scroll through all workspaces with Ctrl + mainMod + arrow keys
hl.bind("CTRL + " .. mainMod .. " + left", hl.dsp.focus({ workspace = "-1" }))
hl.bind("CTRL + " .. mainMod .. " + right", hl.dsp.focus({ workspace = "+1" }))

-- Special workspace / scratchpad
hl.bind(mainMod .. " + S",         	hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + CTRL + down",    hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + mouse:274", hl.dsp.window.move({ workspace = "special:magic" }))


