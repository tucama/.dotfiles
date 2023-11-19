-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
vim.g.mapleader = " "

keymap("n", "<leader>cv", ":e $MYVIMRC<CR>", { desc = "Edit Neovim config" } )
keymap("n", "<leader>r", ":source $MYVIMRC<CR>", { desc = "Reload Neovim config" })

keymap("n", "<leader>cd", ":e $HOME/mydotfiles<CR>", { desc = "Edit dotfiles" })

keymap("n", "<C-s>", ":w<CR>", { desc = "Save file" })

keymap("n", "<leader>o", "o<Esc>k", { desc = "Empty line bellow" })
keymap("n", "<leader>O", "O<Esc>j", { desc = "Empty line above" })

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>")
-- keymap("n", "<C-Down>", ":resize +2<CR>")
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>")
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Navigate buffers
-- keymap("n", "L", ":bnext<CR>")
-- keymap("n", "H", ":bprevious<CR>")

keymap("n", "<C-i>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<C-m>", ":bprevious<CR>", { desc = "Previous buffer" })

keymap("n", "<leader>dd", ":bdelete!<CR>", { desc = "Delete buffer" })
keymap("n", "<leader>df", ":close<CR>", { desc = "Close buffer" })

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==")
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==")

keymap("n", "<C-Down>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<C-Up>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("i", "<C-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
keymap("i", "<C-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
keymap("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Select all
keymap("n", "<leader><C-a>", "ggVG", { desc = "Select all" })

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==")
-- keymap("v", "<A-k>", ":m .-2<CR>==")

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = "Turn file executable"} )

-- Lsp diagnostics
keymap("n", "<leader>le", ":lua vim.diagnostic.enable()<CR>")
keymap("n", "<leader>ld", ":lua vim.diagnostic.disable()<CR>")
