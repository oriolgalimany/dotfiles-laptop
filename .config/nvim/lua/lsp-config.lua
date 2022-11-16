
-- LSP Installer
local lsp_installer = require("nvim-lsp-installer")

-- custom icons
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}
    -- tell sumneko to use vim as global
    if server.name == "sumneko_lua" then
        opts.settings = {
            Lua = {
                diagnostics = { globals = { 'vim' }}
            }
        }
    end

    server:setup(opts)
end)

-- LSP keymapping
local keymap = vim.api.nvim_set_keymap
local opts = { noremap=true }
local function nkeymap(key, map)
    keymap('n', key, map, opts)
end

nkeymap('<leader>gd', ':lua vim.lsp.buf.definition()<cr>')
--nkeymap('<leader>K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<leader>gr', ':lua vim.lsp.buf.references()<cr>')

--nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
--nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
--nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
--nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
--nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
--nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
--nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
--nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
