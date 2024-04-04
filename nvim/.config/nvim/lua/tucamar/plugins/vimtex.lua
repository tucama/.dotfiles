return {
	"lervag/vimtex",
	version = "*",
	-- event = { "BufReadPre", "BufNewFile" },       -- WARNING: adding events can prevent synctex inverse search from working
	config = function()
		vim.g["vimtex_view_method"] = "zathura" -- main variant with xdotool (requires X11; not compatible with wayland)
		vim.g["vimtex_view_general_viewer"] = "okular" -- external PDF viewer run from vimtex menu command
		vim.g["vimtex_view_general_options"] = "--unique file:@pdf#src:@line@tex"
		vim.g["vimtex_compiler_method"] = "latexmk"
	end,
}
