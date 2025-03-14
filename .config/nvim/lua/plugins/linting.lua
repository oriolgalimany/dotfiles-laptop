return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        linters_by_ft = {
            lua = { "luacheck" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
        },
    },
    config = function()
        local lint = require("lint")
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
