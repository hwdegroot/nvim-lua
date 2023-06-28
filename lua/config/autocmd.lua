-- optimizations
vim.cmd[[
au Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/'
au InsertLeave * redraw!
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red'
au BufWritePre * :%s/\s\+$//e
]]

-- lsp diagnostics
vim.cmd('autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, border="rounded"})')

