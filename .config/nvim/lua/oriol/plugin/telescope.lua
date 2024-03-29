local builtin = require('telescope.builtin')

find_in_gitdir = function(opts)
    opts = opts or {}
    opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    builtin.find_files(opts)
end

find_dotfiles = function()
    local opts = {
        search_dirs = {
            '~/.config/nvim',
            '~/.config/tmux',
            '~/.config/alacritty',
            '~/.config/i3',
            '~/.config/polybar',
            '~/.config/picom'
        },
        no_ignore = true,
        no_ignore_parent = true
    }
    builtin.find_files(opts)
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fdf', find_dotfiles, {})
vim.keymap.set('n', '<leader>fr', find_in_gitdir, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local telescope = require('telescope')

telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules", "build", "undodir"
        },
    }
}
