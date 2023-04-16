vim.g.mapleader = " "
vim.keymap.set("n", "<leader>x", vim.cmd.Ex)

-- disable esc in insert mode
vim.keymap.set("i", "<esc>", "<nop>")
-- esc bind
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")

-- clear search highlights
vim.keymap.set("n", "<leader>n", ":noh<CR>")
