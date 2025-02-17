return {
	{
		"windwp/nvim-autopairs",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
			enable_check_bracket_line = false,
			ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
		},
	},

	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
}
