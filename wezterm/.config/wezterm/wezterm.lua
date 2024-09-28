--- My Wezterm config file

local wezterm = require("wezterm")
-- local fish_path = "/usr/bin/fish"

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

-- -- Dim inactive panes
-- config.inactive_pane_hsb = {
--   saturation = 0.24,
--   brightness = 0.5
-- }

-- Keys
local keymaps = require("keymaps")
config.leader = keymaps.leader
config.keys = keymaps.keys
config.key_tables = keymaps.key_tables

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = true
config.show_tab_index_in_tab_bar = false
config.show_tabs_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = false
config.tab_and_split_indices_are_zero_based = false
config.tab_bar_at_bottom = false
config.tab_max_width = 25
config.use_fancy_tab_bar = false
require("tabline")

return config
