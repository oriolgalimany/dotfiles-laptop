
function SetColorScheme(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    -- apply colorscheme
    local command = "sed -i '/source-file/c \\source-file ~/.config/tmux/themes/colorschemes/" .. color .. "' ~/.config/tmux/themes/theme.conf"
    local handle = io.popen(command)

    if handle ~= nil then
       handle:close()
    end

    -- make colorscheme persisten
    command = "sed -i '/SetColorScheme(\"/c \\SetColorScheme(\"" .. color .. "\")' ~/.config/nvim/lua/oriol/colors.lua"

    handle = io.popen(command)

    if handle ~= nil then
       handle:close()
    end

    -- refresh theme
    command= "tmux source-file ~/.config/tmux/themes/theme.conf"
    os.execute(command)
    os.execute(command)
end

SetColorScheme("catppuccin")

