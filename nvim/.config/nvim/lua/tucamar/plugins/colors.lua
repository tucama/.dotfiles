return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                dim_inactive = false,
                transparent_mode = false,
                overrides = {
                    Normal = { bg = "none" },
                    NormalFloat = { bg = "none" },
                    SignColumn = { bg = "none" },
                    DiagnosticSignError = { link = "GruvboxRed" },
                    DiagnosticSignWarn = { link = "GruvboxYellow" },
                    DiagnosticSignHint = { link = "GruvboxBlue" },
                    DiagnosticSignInfo = { link = "GruvboxAcqua" },
                },
            })
            vim.cmd("colorscheme gruvbox")
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
    {
        "unblevable/quick-scope",
        event = { "BufReadPre", "BufNewFile" },
        config = function ()
            vim.api.nvim_create_autocmd("TextYankPost", {
                group = vim.api.nvim_create_augroup("highlight_yank", {}),
                desc = "Hightlight selection on yank",
                pattern = "*",
                callback = function()
                    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 250 })
                end,
            })
        end
    },

}
