-- keep cursor as a block in insert mode
vim.opt.guicursor = ""

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indenttion
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- don't let text exceed window size
vim.opt.wrap = true

-- don't show the command line when it's not needed
vim.opt.cmdheight = 0

-- true colors
vim.opt.termguicolors = true

-- set undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"

-- search options
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- scrolling options
vim.opt.scrolloff = 8
vim.opt.signcolumn = "auto"

-- share clipboard btwn vim and linux; y-p = ctrl-c ctrl-v
vim.opt.clipboard = { "unnamed", "unnamedplus" }

-- vertical splits to the right and horizontal below
vim.opt.splitbelow = true
vim.opt.splitright = true

-- case insensitive only in lowercase searches, otherwise case sensitive
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- toggle relative numbers on focus
vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- no lsp log file, so it cannot grow infinitely, change to "debug" if needed
vim.lsp.set_log_level("off")
