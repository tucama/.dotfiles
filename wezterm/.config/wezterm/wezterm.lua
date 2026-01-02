--- My Wezterm config file
local wezterm = require("wezterm")

-- local fish_path = "/usr/bin/fish" -- im not using fish anymore
local tab = require("tabline")
local keymaps = require("keymaps")

local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

config.enable_wayland = true

-- Settings
-- config.default_prog = { fish_path, "-l" }
-- config.color_scheme = 'GruvboxDarkHard'
-- config.color_scheme = 'Gruvbox dark, soft (base16)'
-- config.color_scheme = 'Fahrenheit'
-- config.color_scheme = 'Sundried'
-- config.color_scheme = 'Treehouse (Gogh)'
-- config.color_scheme = 'Gruber (base16)'
config.colors = require("ashen")
config.colors.tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#121212',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#121212',
      -- The color of the text for the tab
      fg_color = '#D87C4A',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Bold',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      -- underline = 'Double',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      -- strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#121212',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#D87C4A',
      fg_color = '#4A8B8B',
      -- italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#333333',
      fg_color = '#4A8B8B',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#333333',
      fg_color = '#D87C4A',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
}
config.font = wezterm.font_with_fallback({
  { family = "Hack Nerd Font",       scale = 1, weight = "Medium", },
  -- { family = "Firacode",       scale = 1, weight = "Medium", },
})
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 0.7
}

-- Keys
keymaps.apply_to_config(config)

-- Tab bar
tab.apply_to_config(config)

return config
