local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- telescope fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- colorschemes
    'haishanh/night-owl.vim',
    'nyngwang/nvimgelion',
    'rose-pine/neovim',
    'folke/tokyonight.nvim',
    'catppuccin/nvim',
    -- treesitter syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    -- undotree
    'mbbill/undotree',
    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    -- web devicons
    'nvim-tree/nvim-web-devicons',
    -- vim-tmux seamless navigation with ctrl+hjkl
    'christoomey/vim-tmux-navigator',
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },
    -- LSP icons
    'onsails/lspkind.nvim',
    -- indentation guides to all lines
    'lukas-reineke/indent-blankline.nvim',
    -- colorize colorcodes
    'norcalli/nvim-colorizer.lua',
    -- file tree explorer
    'tpope/vim-vinegar',
    --[[ {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly'                    -- optional, updated every week. (see issue #1193)
    }, ]]
    -- toggle between relative numbers and absolute depending on thefocus
    'sitiom/nvim-numbertoggle',
    -- auto closing pairs when writing (["
    { 'echasnovski/mini.pairs', version = '*' },
    -- auto html closing tags
    'windwp/nvim-ts-autotag',
    -- easy comments
    'numToStr/Comment.nvim',
    -- formatting
    'jose-elias-alvarez/null-ls.nvim',
    -- auto saving nvim sessions
    {
        'dhruvasagar/vim-prosession',
        dependencies = { 'tpope/vim-obsession' }
    }
})
