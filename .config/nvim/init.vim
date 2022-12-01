syntax on

set noerrorbells

" don't let text exceed window size
set wrap

" relative number
set number relativenumber
" show current line number
set nu

" toggle per canviar de nu relatiu a no relatiu al sortir del buffer
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" keep cursor as a block in insert mode
set guicursor=

" undo config
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

" search config
set hlsearch
set incsearch
" case insensitive in lowercase searches, otherwise case sensitive
set smartcase
set ignorecase

" tab options
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" fer split vertical per sota i horitzontal per la dreta
set splitbelow
set splitright

" poder copiar desde fora del clipboard
set clipboard^=unnamed,unnamedplus

" scroll starting 8 from the bottom
set scrolloff=8

" extra column useful for lint, git...
set signcolumn=yes

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
" improved syntax hl - treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" fuzzy finder telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" file browser
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
" colorize color codes 
Plug 'norcalli/nvim-colorizer.lua'
" lsp 
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" lsp-autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" undotree
Plug 'mbbill/undotree'
" indent line
Plug 'lukas-reineke/indent-blankline.nvim'
" line bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" seamless navigation tmux and vim panes
Plug 'christoomey/vim-tmux-navigator'
" Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
" vim themes Plugs
Plug 'ghifarit53/tokyonight-vim'
Plug 'erichdongubler/vim-sublime-monokai'
Plug 'haishanh/night-owl.vim'
Plug 'joshdick/onedark.vim'
Plug 'Abstract-IDE/Abstract-cs'
Plug 'gruvbox-community/gruvbox'
call plug#end()

" enable true colors
set termguicolors

" theme
"colorscheme sublimemonokai
"let g:sublimemonokai_term_italic = 1

"let g:tokyonight_style = 'night' "available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight

"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

"colorscheme abscs
"colorscheme rvcs
"colorscheme iceberg
"colorscheme jellybeans
colorscheme night-owl

"colorscheme onedark
"let g:onedark_termcolors=256

"set vim transparency
"hi Normal guibg=none

" Plugins configuration
" activate arrow symbols on airline bar
let g:airline_powerline_fonts = 1

" key mapping & remaps
let mapleader = " "

" disable esc in insert mode
inoremap <esc> <nop>
" esc bind
inoremap jk <esc>
inoremap kj <esc>

" save with <c-s>
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

" clear search highlights
nnoremap <leader>n :noh<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>e :NvimTreeToggle<CR>
"nnoremap <leader>r :NvimTreeRefresh<CR>
"nnoremap <leader>n :NvimTreeFindFile<CR>

lua <<EOF
    require('lsp-config')
    require('treesitter')
    require('indent-blankline')
    require('lualine-config')
    require('nvimtree-config')
    require('cmp-config')
    require('colorizer-config')
EOF
