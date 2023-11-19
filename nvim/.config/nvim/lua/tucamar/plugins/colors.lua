return {
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme gruvbox]])

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


            vim.api.nvim_create_autocmd("TextYankPost", {
                group = vim.api.nvim_create_augroup("highlight_yank", {}),
                desc = "Hightlight selection on yank",
                pattern = "*",
                callback = function()
                    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 250 })
                end,})

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
    }
}
