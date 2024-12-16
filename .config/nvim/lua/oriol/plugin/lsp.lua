local lsp = require('lsp-zero')

--[[
DEFAULT LSP KEYBIDINGS

K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().

gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().

gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().

gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().

go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().

gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().

gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.

<F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().

<F3>: Format code in current buffer. See :help vim.lsp.buf.format().

<F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().

gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().

[d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().

]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().

 ]]
lsp.preset('recommended')

lsp.nvim_workspace()

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local'
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
end)

lsp.format_on_save({
    format_opts = {
        async = true,
    },
    servers = {
        ['null-ls'] = {
            'javascript',
            'typescript',
            'html',
            'css',
            'graphql',
            'json',
            'svelte',
            'bash',
        },
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})

vim.g.diagnostics_visible = true
function _G.toggle_diagnostics()
    if vim.g.diagnostics_visible then
        vim.g.diagnostics_visible = false
        vim.diagnostic.enable(false)
    else
        vim.g.diagnostics_visible = true
        vim.diagnostic.enable()
    end
end

vim.keymap.set('n', '<Leader>d', ':call v:lua.toggle_diagnostics()<CR>', {})
vim.keymap.set('n', 'ca', ':lua vim.lsp.buf.code_action()<CR>', {})
