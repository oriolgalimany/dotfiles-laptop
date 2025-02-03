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
        tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    -- colorschemes
    'haishanh/night-owl.vim',
    'nyngwang/nvimgelion',
    'rose-pine/neovim',
    'folke/tokyonight.nvim',
    'catppuccin/nvim',
    'loctvl842/monokai-pro.nvim',
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
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",  opts = {} },
    -- colorize colorcodes
    'NvChad/nvim-colorizer.lua',
    -- file tree explorer
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- toggle between relative numbers and absolute depending on thefocus
    'sitiom/nvim-numbertoggle',
    -- auto closing pairs when writing (["
    'windwp/nvim-autopairs',
    -- auto html closing tags
    'windwp/nvim-ts-autotag',
    -- add/change/remove surrounds
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
    },
    -- easy comments
    'numToStr/Comment.nvim',
    -- formatting
    'nvimtools/none-ls.nvim',
    -- auto saving nvim sessions
    'rmagatti/auto-session',
    -- diagnostics management
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- git integration
    'tpope/vim-fugitive',
    -- better terminal toggle and control in nvim
    { 'akinsho/toggleterm.nvim',             version = "*", config = true },
    -- jump between buffers
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
})
