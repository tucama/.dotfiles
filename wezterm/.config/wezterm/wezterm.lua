--- My Wezterm config file

local wezterm = require("wezterm")
-- local fish_path = "/usr/bin/fish"

local tab = require("tabline")
local keymaps = require("keymaps")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings
-- config.default_prog = { fish_path, "-l" }
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.font = wezterm.font_with_fallback({
  { family = "Hack Nerd Font",       scale = 1, weight = "Medium", },
})
config.window_background_opacity = 0.75
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 0.4
}

-- Keys
keymaps.apply_to_config(config)

-- Tab bar
tab.apply_to_config(config)

return config
