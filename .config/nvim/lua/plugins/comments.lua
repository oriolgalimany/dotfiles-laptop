return {
	"numToStr/Comment.nvim",
	opts = {
		-- had to add these in order to make block comments work
		toggler = {
			---Line-comment toggle keymap
			line = "gcc",
			---Block-comment toggle keymap
			block = "gbc",
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment keymap
			line = "gc",
			---Block-comment keymap
			block = "gb",
		},
	},
	{
		-- hightlight TODOs
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		keys = {
			{
				"<leader>tt",
				"<cmd>TodoTrouble toggle<cr>",
				desc = "Todo List (Trouble)",
			},
		},
	},
}
