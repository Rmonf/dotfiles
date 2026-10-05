-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

require("devices")
require("ui")
require("start")
require("keybinds")
require("workspaces")
require("eyecandy")
require("misc")

-- For Noctalia Color templates
require("noctalia").apply_theme()


-- Noctalia theme overrides

hl.config({

general = {
	col = { 
		inactive_border = "rgba(595959aa)", 
		},
	},
})
