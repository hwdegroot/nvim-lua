require('config.plugins')
require('config.clipboard')
require('config.colors')
require('config.filetype')
require('config.globals')
require('config.options')
require('config.fold')

require('config.autocmd')

-- TODO works not
vim.cmd [[highlight def link @text.diff.add DiffAdded]]
vim.cmd [[highlight def link @text.diff.delete DiffRemoved]]

