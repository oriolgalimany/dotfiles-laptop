require('auto-session').setup {
    auto_session_root_dir = '~/.local/share/nvim/session/',
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Baixades", "/" },
    auto_restore_enabled = true,
}
