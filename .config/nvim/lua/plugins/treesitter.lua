return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Automatically update parsers after installation
	opts = {
		ensure_installed = { "vimdoc", "javascript", "c", "lua", "rust" }, -- List of parsers to install
		sync_install = false, -- Install parsers synchronously
		auto_install = true, -- Automatically install missing parsers when entering buffer

		indent = {
			enable = true, -- Enable Tree-sitter-based indentation
		},

		highlight = {
			enable = true, -- Enable syntax highlighting
			additional_vim_regex_highlighting = false, -- Disable additional regex-based highlighting
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
