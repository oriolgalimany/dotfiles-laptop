return {
	"rmagatti/auto-session",
	lazy = false,
	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		auto_restore = true,
		root_dir = "~/.local/share/nvim/session/",
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	},
}
