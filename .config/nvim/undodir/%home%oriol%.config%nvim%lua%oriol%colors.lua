Vim�UnDo� {��|]�A�;2wƵ�_x����B���\�   7                                   e�[�     _�                      	        ����                                                                                                                                                                                                                                                                                                                                                             e�[�     �               7   function SetColorScheme(color)   '    color = color or "tokyonight-night"       vim.cmd.colorscheme(color)       !    -- make colorscheme persisten   I    local command = "sed -i '/SetColorScheme(\"/c \\SetColorScheme(\"" ..   ;        color .. "\")' ~/.config/nvim/lua/oriol/colors.lua"       $    local handle = io.popen(command)           if handle ~= nil then           handle:close()       end           '    if color == "tokyonight-night" then           color = "tokyonight"       end           --[[   :let stl_fg         = synIDattr(hlID('StatusLine')  , 'fg')   <  let stl_bg         = synIDattr(hlID('StatusLine')  , 'bg')   A  let stl_reverse    = synIDattr(hlID('StatusLine')  , 'reverse')       <  let stl_nc_fg      = synIDattr(hlID('StatusLineNC'), 'fg')   <  let stl_nc_bg      = synIDattr(hlID('StatusLineNC'), 'bg')   A  let stl_nc_reverse = synIDattr(hlID('StatusLineNC'), 'reverse')       L  let stl_attr       = synIDattr(hlID('StatusLine')  , 'bold') ? 'bold' : ''   L  let stl_nc_attr    = synIDattr(hlID('StatusLineNC'), 'bold') ? 'bold' : ''       G  if stl_fg == -1 || stl_bg == -1 || stl_nc_fg == -1 || stl_nc_bg == -1   q    throw "tmuxline: Can't load theme, vim's colorscheme doesn't define StatusLine/StatusLineNC highlight groups"     endif    ]]       -- apply colorscheme   [    command = "sed -i '/source-file/c \\source-file ~/.config/tmux/themes/colorschemes/" ..   5        color .. "' ~/.config/tmux/themes/theme.conf"       handle = io.popen(command)           if handle ~= nil then           handle:close()       end           -- refresh theme   A    command = "tmux source-file ~/.config/tmux/themes/theme.conf"       os.execute(command)       os.execute(command)   end       "SetColorScheme("tokyonight-night")       8local ret = vim.api.nvim_get_hl_by_name("Keyword", true)       -- print(vim.inspect(ret))5�5��