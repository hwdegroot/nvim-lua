local vim = vim
local autocmd = vim.api.nvim_create_autocmd

vim.cmd [[
filetype plugin indent on
filetype off
]]

-- custom ssh.config files
autocmd({ 'BufRead', 'BufNewFile' }, { pattern = '*.sshconfig', command = 'set filetype=sshconfig' })
-- Salesforce filetype
autocmd({ 'BufRead', 'BufNewFile' }, { pattern = '*.cls,*.trigger,*.apex', command = 'set filetype=apex' })
-- env file variants. Syntax file in ~/.config/nvim/syntax/env.vim
autocmd({ 'BufRead', 'BufNewFile' }, { pattern = '*.env,*.env.*', command = 'set filetype=env' })
-- got indentation differs from user preferred
autocmd({ 'FileType' }, { pattern = 'go', command = 'set autoindent noexpandtab tabstop=4 shiftwidth=4' })
-- C and C# indentation have different defaults than user preferred
autocmd({ 'FileType' }, { pattern = 'c', command = 'set autoindent expandtab tabstop=2 shiftwidth=2' })
autocmd({ 'FileType' }, { pattern = 'cs', command = 'set autoindent expandtab tabstop=4 shiftwidth=4' })
-- Use tabs for nginx
autocmd({ 'FileType' }, { pattern = 'nginx', command = 'set autoindent noexpandtab tabstop=4 shiftwidth=4' })
