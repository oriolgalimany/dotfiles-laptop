vim.g.mapleader = " "

-- disable esc in insert mode
vim.keymap.set("i", "<esc>", "<nop>")
-- esc bind
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")

-- clear search highlights
vim.keymap.set("n", "<leader>n", ":noh<CR>")

-- center cursor on c-d c-u
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- center cursor on searches
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- add blank newline with return
vim.keymap.set("n", "<enter>", "_i<enter><esc>_k")

-- resize windows 5 pixels
vim.keymap.set("n", "<C-w>+", ":resize +10<CR>")
vim.keymap.set("n", "<C-w>-", ":resize -10<CR>")
vim.keymap.set("n", "<C-w>>", ":vertical:resize +10<CR>")
vim.keymap.set("n", "<C-w><", ":vertical:resize -10<CR>")

-- u in visual mode to cancel the visual selection
vim.api.nvim_set_keymap("x", "u", "<esc>", { noremap = true, silent = true })
