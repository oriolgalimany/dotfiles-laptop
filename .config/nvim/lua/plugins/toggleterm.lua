return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<c-t>]],
		hide_numbers = true, -- hide the number column in toggleterm buffers
		autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
		direction = "horizontal",
	},

	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], {}),
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], {}),
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], {}),
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], {}),
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], {}),
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], {}),
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], {}),
}
