-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function ()
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)

hl.on("hyprland.start", function ()
  hl.exec_cmd("uwsm app -- /usr/lib/hyprpolkitagent/hyprpolkitagent")                   -- Auth Agent
  -- hl.exec_cmd("uwsm app -- mako")                                                       -- Notificatio>
  -- hl.exec_cmd("uwsm app -- hyprlauncher -d")                                            -- App launcher
  -- hl.exec_cmd("uwsm app -- hyprpaper")                                                  -- Wallpaper D>
  hl.exec_cmd("uwsm app -- noctalia")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
