require("oil").setup(
    {
        columns = {
            -- "icon"
            -- "permissions",
            -- "size",
            -- "mtime",
        },
        keymaps = {
            ["H"] = "actions.toggle_hidden",
        }
    }
)
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
