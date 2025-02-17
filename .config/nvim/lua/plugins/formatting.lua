return {
	"stevearc/conform.nvim",
	jevent = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},
		format_on_save = {
			timeout_ms = 500,
			async = false,
			lsp_format = "fallback",
		},
	},
}
