--Remap space as leader key
vim.g.mapleader = " "
local map = vim.keymap.set

-- Not working well with whichkey
map("n", "<leader>w", "<C-w>", { desc = "Window control" })

-- Use Alpha NVIM to access this
-- map("n", "<leader>cv", ":edit $MYVIMRC<CR>", { desc = "Edit Neovim config" })
-- map("n", "<leader>cv", ":cd $XDG_CONFIG_HOME/nvim | edit $MYVIMRC<CR>", { desc = "Edit Neovim config" })
-- map("n", "<leader>cd", ":edit $HOME/.dotfiles<CR>", { desc = "Edit dotfiles" })

map("n", "<leader>rv", ":source $MYVIMRC<CR>", { desc = "Reload Neovim config" })


map("n", "<C-s>", ":w<CR>", { desc = "Save file" })

map("n", "<leader>o", "o<Esc>k", { desc = "Empty line bellow" })
map("n", "<leader>O", "O<Esc>j", { desc = "Empty line above" })

-- Resize with arrows
-- map("n", "<C-Up>", ":resize -2<CR>")
-- map("n", "<C-Down>", ":resize +2<CR>")
-- map("n", "<C-Left>", ":vertical resize -2<CR>")
-- map("n", "<C-Right>", ":vertical resize +2<CR>")

map("n", "J", "mzJ`z", { desc = "Merge line below"})
map("n", "<C-d>", "<C-d>zz", { desc = "Move half page up"})
map("n", "<S-Up>", "<C-u>zz", { desc = "Move half page up"})
map("n", "<C-u>", "<C-u>zz", { desc = "Move half page down"})
map("n", "<S-Down>", "<C-d>zz", { desc = "Move half page down"})
map("n", "n", "nzzzv", { desc = "Next selection"})
map("n", "N", "Nzzzv", { desc = "Previous selection"})

-- Navigate buffers
-- map("n", "L", ":bnext<CR>")
-- map("n", "H", ":bprevious<CR>")

map("n", "<C-i>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<C-m>", ":bprevious<CR>", { desc = "Previous buffer" })

map("n", "<leader>dd", ":bdelete!<CR>", { desc = "Delete buffer" })
map("n", "<leader>df", ":close<CR>", { desc = "Close buffer" })

-- Move text up and down
-- map("n", "<A-j>", "<Esc>:m .+1<CR>==")
-- map("n", "<A-k>", "<Esc>:m .-2<CR>==")

map("n", "<C-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<C-Up>", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<C-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<C-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent"})
map("v", ">", ">gv", { desc = "Unindent"})

-- Select all
map("n", "<leader><C-a>", "ggVG", { desc = "Select all" })

-- Move text up and down
-- map("v", "<A-j>", ":m .+1<CR>==")
-- map("v", "<A-k>", ":m .-2<CR>==")

-- Turn file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = "Turn file executable" })

-- Lsp diagnostics
map("n", "<leader>le", ":lua vim.diagnostic.toggle()<CR>", { desc = "Enable LSP diagnostic"})
-- map("n", "<leader>ld", ":lua vim.diagnostic.disable()<CR>", { desc = "Disable LSP diagnostic"})
