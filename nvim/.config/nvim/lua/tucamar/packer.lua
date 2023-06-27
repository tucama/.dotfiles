-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    use({ 'ellisonleao/gruvbox.nvim' })
    use("nvim-treesitter/nvim-treesitter-context");
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }
    -- use("nvim-treesitter/playground")
    -- use("theprimeagen/refactoring.nvim")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use({ "goolord/alpha-nvim" })           -- Autopairs, integrates with both cmp and treesitter
    use({ "windwp/nvim-autopairs" })        -- Autopairs, integrates with both cmp and treesitter
    use({ "windwp/nvim-ts-autotag" })       -- Autopairs, integrates with both cmp and treesitter
    use({ "tpope/vim-surround" })           -- love this
    use({ "numToStr/Comment.nvim" })        -- commenting shortcut "gcc"
    use({ "kyazdani42/nvim-web-devicons" }) -- icons
    use({ "unblevable/quick-scope" })       -- highlights unique chars in words

    use({ "nvim-lualine/lualine.nvim" })    -- statusline
    use({ "kyazdani42/nvim-tree.lua" })     -- file tree
    use({ "norcalli/nvim-colorizer.lua" })  -- colorize rgb, hex color
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
            { 'saadparwaiz1/cmp_luasnip' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'honza/vim-snippets' },
        }
    }
end)
