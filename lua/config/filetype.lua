local vim = vim
local autocmd = vim.api.nvim_create_autocmd

vim.cmd [[
filetype plugin indent on
filetype off
]]

autocmd({ 'BufRead','BufNewFile'}, { pattern = '*.cls,*.trigger,*.apex', command = 'set filetype=apex'})
autocmd({ 'FileType'}, { pattern = 'go', command = 'set autoindent noexpandtab tabstop=4 shiftwidth=4'})
