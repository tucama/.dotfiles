local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- Send C-a when pressing C-a twice
  { key = "a",          mods = "LEADER|CTRL", action = act.SendKey { key = "a", mods = "CTRL" } },
  { key = "c",          mods = "LEADER",      action = act.ActivateCopyMode },
  { key = "phys:Space", mods = "LEADER",      action = act.ActivateCommandPalette },

  -- Pane keybindings
    { key = "s",          mods = "LEADER",      action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = "v",          mods = "LEADER",      action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },

    { key = "LeftArrow",          mods = "ALT",      action = act.ActivatePaneDirection("Left") },
    { key = "DownArrow",          mods = "ALT",      action = act.ActivatePaneDirection("Down") },
    { key = "UpArrow",            mods = "ALT",      action = act.ActivatePaneDirection("Up") },
    { key = "RightArrow",         mods = "ALT",      action = act.ActivatePaneDirection("Right") },

    { key = "h",          mods = "ALT",      action = act.ActivatePaneDirection("Left") },
    { key = "j",          mods = "ALT",      action = act.ActivatePaneDirection("Down") },
    { key = "k",          mods = "ALT",      action = act.ActivatePaneDirection("Up") },
    { key = "l",          mods = "ALT",      action = act.ActivatePaneDirection("Right") },

    { key = "x",          mods = "CTRL",      action = act.CloseCurrentPane { confirm = true } },
    { key = "z",          mods = "LEADER",      action = act.TogglePaneZoomState },
    { key = "o",          mods = "LEADER",      action = act.RotatePanes "Clockwise" },
    -- We can make separate keybindings for resizing panes
    -- But Wezterm offers custom "mode" in the name of "KeyTable"
    { key = "r",          mods = "LEADER",      action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },
    { key = "m",          mods = "LEADER",      action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },

    -- Tab keybindings
    { key = "t",          mods = "CTRL",      action = act.SpawnTab("CurrentPaneDomain") },
    { key = "[",          mods = "LEADER",      action = act.ActivateTabRelative(-1) },
    { key = "]",          mods = "LEADER",      action = act.ActivateTabRelative(1) },
    { key = "n",          mods = "LEADER",      action = act.ShowTabNavigator },
    {
      key = "e",
      mods = "LEADER",
      action = act.PromptInputLine {
        description = wezterm.format {
          { Attribute = { Intensity = "Bold" } },
          { Foreground = { AnsiColor = "Fuchsia" } },
          { Text = "Renaming Tab Title...:" },
        },
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end)
      }
    },

    -- Key table for moving tabs around
    { key = "m", mods = "LEADER",       action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },
    -- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
    { key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
    { key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

    -- Lastly, workspace
    { key = "w", mods = "LEADER",       action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },

}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = act.ActivateTab(i - 1)
    })
end

config.key_tables = {
    resize_pane = {
        { key = "LeftArrow",      action = act.AdjustPaneSize { "Left", 1 } },
        { key = "DownArrow",      action = act.AdjustPaneSize { "Down", 1 } },
        { key = "UpArrow",      action = act.AdjustPaneSize { "Up", 1 } },
        { key = "RightArrow",      action = act.AdjustPaneSize { "Right", 1 } },

        { key = "h",      action = act.AdjustPaneSize { "Left", 1 } },
        { key = "j",      action = act.AdjustPaneSize { "Down", 1 } },
        { key = "k",      action = act.AdjustPaneSize { "Up", 1 } },
        { key = "l",      action = act.AdjustPaneSize { "Right", 1 } },
        { key = "Escape", action = "PopKeyTable" },
        { key = "Enter",  action = "PopKeyTable" },
    },
    move_tab = {
        { key = "LeftArrow",       action = act.MoveTabRelative(-1) },
        { key = "DownArrow",       action = act.MoveTabRelative(-1) },
        { key = "UpArrow",         action = act.MoveTabRelative(1) },
        { key = "RightArrow",      action = act.MoveTabRelative(1) },

        { key = "h",      action = act.MoveTabRelative(-1) },
        { key = "j",      action = act.MoveTabRelative(-1) },
        { key = "k",      action = act.MoveTabRelative(1) },
        { key = "l",      action = act.MoveTabRelative(1) },
        { key = "Escape", action = "PopKeyTable" },
        { key = "Enter",  action = "PopKeyTable" },
    }
}

return config
