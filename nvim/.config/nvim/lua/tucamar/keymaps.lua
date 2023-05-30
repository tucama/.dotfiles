-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",
-- Go to vimrc
keymap("n", "<leader>cv", ":e $MYVIMRC<CR>")
keymap("n", "<leader>r", ":source $MYVIMRC<CR>")
-- Go to dot files
keymap("n", "<leader>cd", ":e $HOME/mydotfiles<CR>")

keymap("n", "<C-s>", ":w!<CR>")
-- Runs current buffers
keymap("n", "<F9>", "<Esc>:w<enter>:! chmod +x %<enter>:! %<enter>")
keymap("i", "<F9>", "<Esc>:w<enter>:! chmod +x %<enter>:! %<enter>")

keymap("n", "<leader>o", "o<Esc>k")
keymap("n", "<leader>O", "O<Esc>j")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Navigate buffers
keymap("n", "L", ":bnext<CR>")
keymap("n", "H", ":bprevious<CR>")
keymap("n", "<leader>dd", ":bdelete!<CR>")
keymap("n", "<leader>df", ":close<CR>")

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==")
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==")

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>")
keymap("i", "kj", "<ESC>")
keymap("i", "ii", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Select all
keymap("n", "<leader><C-a>", "ggVG")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>")
keymap("n", "<leader>fr", "<cmd>Telescope git_branches<cr>")

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>")



vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
  end,
})
