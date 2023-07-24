-- Make sure you setup `cmp` after lsp-zero

local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = require('lspkind').cmp_format({
            mode = 'symbol_text',  -- show only symbol annotations
            preset = 'codicons',   -- requires codicons.ttf vscode font
            maxwidth = 50,         -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
        })
    },
    sources = { -- both sources needed to lsp signature work with lsp
        { name = "nvim_lsp" },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' }
    }
})
