return {
	{
		"williamboman/mason.nvim",
		-- setup required. mason doesn't  recomend deferring the setup
		config = function()
			require("mason").setup()
		end,
	},
	{

		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		-- make lua know global vim variables:
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},

		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
		end,
	},
}
