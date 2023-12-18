local vim = vim

vim.cmd [[
filetype plugin indent on
filetype off
]]

vim.cmd [[
au BufRead,BufNewFile *.cls,*.trigger,*.apex set filetype=apex
]]
