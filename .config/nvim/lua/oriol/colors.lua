--vim.api.nvim_set_hl(0, "Normal", { bg="none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg="none" })

function SetColorScheme(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    -- apply colorscheme 
    local command = "sed -i '/source-file/c \\source-file ~/.config/tmux/themes/colorschemes/" .. color .. "' ~/.config/tmux/themes/theme.conf"
    local handle = io.popen(command)

    if handle ~= nil then
       handle:close()
    end

    -- refresh theme
    command= "tmux source-file ~/.config/tmux/themes/theme.conf"
    print(command)
    os.execute(command)
    os.execute(command)
end

