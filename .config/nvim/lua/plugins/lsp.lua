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
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"svelte",
				"html",
				"tailwindcss",
				"bashls",
				"gopls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.svelte.setup({
				capabilities = capabilities,
				-- There is a svelte LSP bug that returns the exact same definition twice
				-- in case of multiple results go to the first one
				handlers = {
					["textDocument/definition"] = function(err, result, ctx, config)
						if type(result) == "table" then
							result = { result[1] }
						end
						vim.lsp.handlers["textDocument/definition"](err, result, ctx, config)
					end,
				},
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
				end,
			})
		end,
	},
}
