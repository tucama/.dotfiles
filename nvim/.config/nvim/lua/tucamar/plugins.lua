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
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "tpope/vim-surround" })
	use({ "numToStr/Comment.nvim" })
	use({ "akinsho/bufferline.nvim" }) -- line with buffers
	use({ "nvim-lualine/lualine.nvim" }) -- statusline
	use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243", requires="kyazdani42/nvim-web-devicons" })
  use({ "unblevable/quick-scope" })
  vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
  use({ "nvim-treesitter/playground" })
  use({ "theprimeagen/harpoon" })
  use({ "theprimeagen/refactoring.nvim" })
  use({ "mbbill/undotree" })
  use({ "tpope/vim-fugitive" })
  use({ "nvim-treesitter/nvim-treesitter-context" })

  -- Colorschemes
	use({ "gruvbox-community/gruvbox" })

	-- Telescope

	-- Treesitter
  use({
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,})


  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
      {'williamboman/mason-lspconfig.nvim'},
		  {'williamboman/mason.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
end)

