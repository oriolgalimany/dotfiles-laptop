-- Set which colors to use
function SetColorScheme(color)
    -- default colorscheme
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    -- make colorscheme persisten
    local command = 'sed -i \'/^SetColorScheme(/s/.*/SetColorScheme("'
        .. color
        .. '")/' .. "' ~/.config/nvim/lua/config/colors.lua 2>&1"
    local handle = io.popen(command)

    if handle ~= nil then
        handle:close()
    end
end

function SetTmuxTheme()
    -- Extract colors from current session
    local function rgb_to_hex(rgb)
        if not rgb or rgb == 0 then return nil end
        return string.format("#%06x", rgb)
    end

    local function get_hl_color(group_name, attr)
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group_name })
        if ok and hl and hl[attr] then
            return rgb_to_hex(hl[attr])
        end
        return nil
    end

    local bg_color = get_hl_color('Normal', 'bg') or '#1e1e1e'
    local fg_color = get_hl_color('Normal', 'fg') or '#ffffff'
    local secondary_bg = get_hl_color('StatusLine', 'bg') or bg_color
    local secondary_fg = get_hl_color('StatusLine', 'fg') or fg_color
    local inactive_fg = get_hl_color('Comment', 'fg') or '#808080'

    -- print("Extracted colors:")
    -- print("  bg: " .. bg_color .. ", fg: " .. fg_color)

    -- Create tmux colorscheme file directly
    local colorscheme_dir = os.getenv('HOME') .. '/.config/tmux/themes'
    local colorscheme_file = colorscheme_dir .. '/colorscheme'

    os.execute('mkdir -p "' .. colorscheme_dir .. '"')

    -- Create the colorscheme file
    local file = io.open(colorscheme_file, 'w')
    if file then
        file:write('# Tmux colorscheme extracted from Neovim\n')
        file:write('# Generated on ' .. os.date() .. '\n')
        file:write('# Source this file in your tmux.conf with: source-file ~/.config/tmux/themes/colorscheme\n\n')
        file:write('# Color variables\n')
        file:write('background_color="' .. bg_color .. '"\n')
        file:write('background_color2="' .. secondary_bg .. '"\n')
        file:write('active_text_color="' .. fg_color .. '"\n')
        file:write('active_text_color2="' .. secondary_fg .. '"\n')
        file:write('inactive_text_color="' .. inactive_fg .. '"\n\n')
        file:write('# You can now use these variables in your tmux configuration like:\n')
        file:write('# set -g status-style "bg=$background_color,fg=$active_text_color"\n')
        file:write('# set -g window-status-current-style "bg=$background_color2,fg=$active_text_color2"\n')
        file:write('# set -g window-status-style "bg=$background_color,fg=$inactive_text_color"\n')
        file:close()
        -- print("Tmux colorscheme file created at: " .. colorscheme_file)
    else
        print("Error: Could not create colorscheme file")
    end

    -- Source tmux theme
    local tmux_command = "tmux source-file ~/.config/tmux/themes/theme.conf"
    os.execute(tmux_command)
    os.execute(tmux_command)
    -- print("Tmux theme reloaded")
end

SetColorScheme("rose-pine-main")


vim.api.nvim_create_user_command('Colorscheme', function(opts)
    if opts.args == '' then
        return
    end
    vim.cmd('colorscheme ' .. opts.args)
    SetColorScheme(opts.args)
    SetTmuxTheme()
end, {
    nargs = '?',
    complete = 'color',
    desc = 'Set colorscheme with and change Tmux bar',
})
