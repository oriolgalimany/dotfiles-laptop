-- keep cursor as a block in insert mode
-- vim.opt.guicursor = ""

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

-- vertical splits to the left and horizontal below
vim.opt.splitbelow = true
vim.opt.splitright = false

-- case insensitive only in lowercase searches, otherwise case sensitive
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- toggle relative numbers on focus
vim.api.nvim_create_augroup("numbertoggle", { clear = true })

--augroup numbertoggle
--  autocmd!
--  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
--  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
--augroup END


--vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
--  callback = function()
--    vim.opt.relativenumber = true
--  end,
 -- group = "numbertoggle",
--})

--vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
--  callback = function()
--    vim.opt.relativenumber = false
--  end,
--  group = "numbertoggle",
--})
