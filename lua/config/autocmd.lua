vim.cmd[[
au Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/'
au InsertLeave * redraw!
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red'
au BufWritePre * :%s/\s\+$//e
]]

-- cokeline
vim.cmd "au VimEnter * hi! tablinefill guifg=NONE guibg=NONE"

-- nvim-tree
vim.cmd "au BufWinEnter NvimTree setlocal nonumber"
