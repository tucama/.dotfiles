require('gruvbox').setup({
    disable_background = true
})

function ColorMyPencils(color) 
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup()

ColorMyPencils()
