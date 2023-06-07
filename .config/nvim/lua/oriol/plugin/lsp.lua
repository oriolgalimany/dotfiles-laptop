local lsp = require('lsp-zero')

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
        vim.diagnostic.disable()
    else
        vim.g.diagnostics_visible = true
        vim.diagnostic.enable()
    end
end

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>d', ':call v:lua.toggle_diagnostics()<CR>',
    { silent = true, noremap = true })
