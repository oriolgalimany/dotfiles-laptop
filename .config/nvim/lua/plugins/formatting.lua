return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            svelte = { "prettier" },
        },
        format_on_save = function(bufnr)
            if vim.bo[bufnr].filetype == "typescript" or "javascript" or "svelte" then
                return {
                    lsp_format = "prefer",
                    timeout_ms = 500,
                    async = false,
                }
            else
                return {
                    lsp_format = "fallback",
                    timeout_ms = 500,
                    async = false,
                }
            end
        end,
    },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true })
            end,
            desc = "Code Format",
        },
    },
}
