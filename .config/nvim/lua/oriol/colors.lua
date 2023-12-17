function SetColorScheme(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    -- make colorscheme persisten
    local command = "sed -i '/SetColorScheme(\"/c \\SetColorScheme(\"" ..
        color .. "\")' ~/.config/nvim/lua/oriol/colors.lua"

    local handle = io.popen(command)

    if handle ~= nil then
        handle:close()
    end


    if color == "tokyonight-night" then
        color = "tokyonight"
    end

    --[[
let stl_fg         = synIDattr(hlID('StatusLine')  , 'fg')
  let stl_bg         = synIDattr(hlID('StatusLine')  , 'bg')
  let stl_reverse    = synIDattr(hlID('StatusLine')  , 'reverse')

  let stl_nc_fg      = synIDattr(hlID('StatusLineNC'), 'fg')
  let stl_nc_bg      = synIDattr(hlID('StatusLineNC'), 'bg')
  let stl_nc_reverse = synIDattr(hlID('StatusLineNC'), 'reverse')

  let stl_attr       = synIDattr(hlID('StatusLine')  , 'bold') ? 'bold' : ''
  let stl_nc_attr    = synIDattr(hlID('StatusLineNC'), 'bold') ? 'bold' : ''

  if stl_fg == -1 || stl_bg == -1 || stl_nc_fg == -1 || stl_nc_bg == -1
    throw "tmuxline: Can't load theme, vim's colorscheme doesn't define StatusLine/StatusLineNC highlight groups"
  endif
 ]]
    -- apply colorscheme
    command = "sed -i '/source-file/c \\source-file ~/.config/tmux/themes/colorschemes/" ..
        color .. "' ~/.config/tmux/themes/theme.conf"
    handle = io.popen(command)

    if handle ~= nil then
        handle:close()
    end

    -- refresh theme
    command = "tmux source-file ~/.config/tmux/themes/theme.conf"
    os.execute(command)
    os.execute(command)
end

SetColorScheme("tokyonight-night")

local ret = vim.api.nvim_get_hl_by_name("Keyword", true)

-- print(vim.inspect(ret))
