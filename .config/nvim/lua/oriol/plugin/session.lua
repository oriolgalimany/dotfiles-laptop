require('auto-session').setup {
    auto_restore = true,
    root_dir = "~/.local/share/nvim/session/",
    suppressed_dirs = { "~/", "~/Projects", "~/Baixades", "/" }
}
