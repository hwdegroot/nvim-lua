local vim = vim
local autocmd = vim.api.nvim_create_autocmd

vim.cmd [[
filetype plugin indent on
filetype off
]]

autocmd({ 'BufRead', 'BufNewFile' }, { pattern = '*.cls,*.trigger,*.apex', command = 'set filetype=apex' })
autocmd({ 'FileType' }, { pattern = 'go', command = 'set autoindent noexpandtab tabstop=4 shiftwidth=4' })
autocmd({ 'FileType' }, { pattern = 'c', command = 'set autoindent expandtab tabstop=2 shiftwidth=2' })
autocmd({ 'FileType' }, { pattern = 'cs', command = 'set autoindent expandtab tabstop=4 shiftwidth=4' })
autocmd({ 'FileType' }, { pattern = 'nginx', command = 'set autoindent noexpandtab tabstop=4 shiftwidth=4' })
