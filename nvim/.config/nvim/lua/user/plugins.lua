local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  -- Is using a standard Neovim install, i.e. built from source or using a
  -- provided appimage.
	-- My plugins here
	use({ "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }) -- Have packer manage itself
  use('lewis6991/impatient.nvim')
  use({ "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }) -- Autopairs, integrates with both cmp and treesitter
	use( "tpope/vim-surround" )
	use({ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" })
	use({ "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" })
	use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
	use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" }) -- line with buffers
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })  -- closes vim
	use({ "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" }) -- terminal
	use({ "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" }) -- statusline
  use( "dstein64/vim-startuptime" )
  use{ "unblevable/quick-scope" }
  vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
  use('glench/vim-jinja2-syntax')
 --  -- TODO learn how to use
	-- use({ "Tastyep/structlog.nvim" })
	-- use({ "nvim-lua/popup.nvim" })
 --  use({ "williamboman/mason-lspconfig.nvim" })
	-- use({ "folke/which-key.nvim" })
 --  use {
 --      'goolord/alpha-nvim',
 --      requires = { 'kyazdani42/nvim-web-devicons' },
 --      config = function ()
 --        require'alpha'.setup(require'alpha.themes.startify'.config)
 --      end
 --  }
	-- use({ "ahmedkhalf/project.nvim" })
	-- use({ "lukas-reineke/indent-blankline.nvim" })
 --  use{
 --    'anuvyklack/pretty-fold.nvim',
 --    config = function()
 --      require('pretty-fold').setup()
 --     end
 --  }

		-- Colorschemes

	use("gruvbox-community/gruvbox")
  use("dikiaap/minimalist")

	-- cmp plugins
  use({ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })
  use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions

	-- snippets
	use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use
	use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- for formatters and linters

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })

	-- Treesitter
	use({"nvim-treesitter/nvim-treesitter", commit = "518e27589c0463af15463c9d675c65e464efc2fe"})


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

