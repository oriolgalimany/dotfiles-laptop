return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	lazy = false,
	opts = {
		columns = {
			-- "icon"
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		keymaps = {
			["H"] = "actions.toggle_hidden",
		},
	},

	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
}
