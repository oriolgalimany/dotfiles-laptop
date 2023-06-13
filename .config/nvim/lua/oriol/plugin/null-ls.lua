-- check for builtin linters and formatters:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- and install them using mason

local lsp = require('lsp-zero')
local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
    end,
    sources = {
        null_ls.builtins.formatting.prettierd, -- html, css, js
        null_ls.builtins.code_actions.eslint_d,
    }
})
