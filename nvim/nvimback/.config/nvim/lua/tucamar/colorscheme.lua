vim.api.nvim_command([[
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
]])

vim.cmd ([[
try
  colorscheme gruvbox
  hi Normal guibg=NONE ctermbg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]])
