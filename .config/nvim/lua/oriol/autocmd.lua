local cmd = vim.cmd

cmd [[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]]

cmd [[
    augroup TrimWhiteSpaces
        autocmd!
        autocmd BufWritePre * :%s/\s\+$//e
    augroup end
]]

cmd [[
     augroup SaveSessions
         autocmd!
         autocmd BufWritePre * silent! :SessionSave
     augroup end
]]
