return {
	{
		"lervag/vimtex",
		version = "*",
		-- event = { "BufReadPre", "BufNewFile" },       -- WARNING: adding events can prevent synctex inverse search from working
		config = function()
			vim.cmd([[:autocmd BufNewFile,BufRead *.tex VimtexCompile]])

			vim.g.vimtex_compiler_latexmk = {
				build_dir = ".out",
				options = {
					"-shell-escape",
					"-verbose",
					"-file-line-error",
					"-interaction=nonstopmode",
					"-synctex=1",
				},
			}

			vim.g.vimtex_view_method = "zathura"

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("tex_wrap", { clear = true }),
				pattern = "tex",
				callback = function()
					vim.opt_local.foldcolumn = "1"
					vim.opt_local.foldlevelstart = 99
					vim.opt_local.foldenable = true
					vim.opt_local.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
					vim.g.vimtex_fold_enabled = true
					vim.api.nvim_set_keymap("n", "<leader>j", "zc", { noremap = true, silent = true })
					vim.api.nvim_set_keymap("n", "<leader>k", "zo", { noremap = true, silent = true })
				end,
			})
		end,
	},
	{
		"andrewferrier/wrapping.nvim",
		config = function()
			require("wrapping").setup({
				opts = {
					auto_set_mode_filetype_allowlist = {
						"asciidoc",
						"gitcommit",
						"latex",
						"mail",
						"markdown",
						"rst",
						"tex",
						"text",
					},
				},
			})
		end,
	},
}
