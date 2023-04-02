-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- telescope fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- colorschemes 
    use ({
        'haishanh/night-owl.vim',
        as = 'night-owl',
        config = function ()
            vim.cmd('colorscheme night-owl')
        end
    })

    use ({
        'ghifarit53/tokyonight-vim',
        as = 'tokyonight',
        config = function ()
            vim.cmd('colorscheme tokyonight')
        end
    })
   
    -- treesitter syntax highlighting
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- undotree
    use('mbbill/undotree')

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- vim-tmux seamless navigation with ctrl+hjkl
    use('christoomey/vim-tmux-navigator')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- indentation guides to all lines 
    use('lukas-reineke/indent-blankline.nvim')

    -- colorize colorcodes
    use('norcalli/nvim-colorizer.lua')
    
    -- file tree explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- toggle between relative numbers and absolute depending on thefocus
    use {
        "sitiom/nvim-numbertoggle",
        config = function()
            require("numbertoggle").setup()
        end
    }

end)
