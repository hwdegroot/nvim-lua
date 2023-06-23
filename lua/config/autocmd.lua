vim.cmd[[
au Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/'
au InsertLeave * redraw!
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red'
au BufWritePre * :%s/\s\+$//e
]]

