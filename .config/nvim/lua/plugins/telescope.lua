return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			file_ignore_patterns = { -- Ignore these directories/files
				"node_modules",
				"build",
				"undodir",
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		-- Find files in the current Git repository
		find_in_gitdir = function(opts)
			opts = opts or {}
			opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
			builtin.find_files(opts)
		end

		-- Find dotfiles in specific config directories
		find_dotfiles = function()
			local opts = {
				search_dirs = {
					"~/.config/nvim",
					"~/.config/tmux",
					"~/.config/alacritty",
					"~/.config/i3",
					"~/.config/polybar",
					"~/.config/picom",
				},
				no_ignore = true,
				no_ignore_parent = true,
			}
			builtin.find_files(opts)
		end

		-- Key mappings for Telescope
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fdf", find_dotfiles, { desc = "Find Dotfiles" })
		vim.keymap.set("n", "<leader>fr", find_in_gitdir, { desc = "Find in Git Directory" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })

		-- Set up Telescope options
		telescope.setup(opts)
	end,
}
