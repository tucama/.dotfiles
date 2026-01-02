local wezterm = require("wezterm")

local tab = {}

function tab.apply_to_config(c)
    c.enable_tab_bar = true
    c.hide_tab_bar_if_only_one_tab = false
    c.show_new_tab_button_in_tab_bar = true
    c.show_tab_index_in_tab_bar = false
    c.show_tabs_in_tab_bar = true
    c.switch_to_last_active_tab_when_closing_tab = false
    c.tab_and_split_indices_are_zero_based = false
    c.tab_bar_at_bottom = false
    c.tab_max_width = 25
    c.use_fancy_tab_bar = false

    local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
    tabline.setup({
        options = {
            icons_enabled = true,
            theme = c.colors,
            -- theme = 'ashen',
            color_overrides = {},
            section_separators = {
                left = wezterm.nerdfonts.pl_left_hard_divider,
                right = wezterm.nerdfonts.pl_right_hard_divider,
            },
            component_separators = {
                left = wezterm.nerdfonts.pl_left_soft_divider,
                right = wezterm.nerdfonts.pl_right_soft_divider,
            },
            tab_separators = {
                left = wezterm.nerdfonts.pl_left_hard_divider,
                right = wezterm.nerdfonts.pl_right_hard_divider,
            },
        },
        sections = {
            tabline_a = { ' ' },
            tabline_b = { ' ' },
            tabline_c = { ' ' },
            tab_active = {
                'index',
                -- { 'cwd', padding = { left = 0, right = 1 } },
                -- '$',
                { 'process', padding = 0 },
                { 'zoomed', padding = 10 },
            },
            -- tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
            tab_inactive = {
                'index',
                { 'process', padding = 0 },
                -- '/',
                -- { 'cwd', padding = { left = 0, right = 1 } },
                { 'zoomed', padding = 7 },
            },
            tabline_x = {},
            tabline_y = { 'battery' },
            tabline_z = { 'hostname' },
        },
        extensions = {},
    })
end

return tab
