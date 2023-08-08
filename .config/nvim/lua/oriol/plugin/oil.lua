require("oil").setup(
    {
        columns = {
            -- "icon"
            -- "permissions",
            -- "size",
            -- "mtime",
        }
    }
)
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
