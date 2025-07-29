return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    },

    settings = {
        save_on_toggle = false,
    },
    config = function(_, opts)
        require("harpoon").setup(opts)

        local harpoon = require("harpoon")

        -- Setup harpoon with your custom settings
        harpoon:setup({
            settings = {
                save_on_toggle = true,
            },
        })

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", "<leader>e", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<leader>h", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<leader>j", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<leader>k", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<leader>l", function()
            harpoon:list():select(4)
        end)


        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "<C-S-N>", function()
            harpoon:list():next()
        end)

        harpoon:extend({
            UI_CREATE = function(cx)
                -- Splits
                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-s>", function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-t>", function()
                    harpoon.ui:select_menu_item({ tabedit = true })
                end, { buffer = cx.bufnr })

                -- close
                vim.keymap.set("n", "<C-c>", function()
                    harpoon.ui:close_menu()
                end)
            end,
        })
    end,
}
