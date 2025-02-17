local vim = vim
local api = require('nvim-tree.api')

-- https://github.com/nvim-tree/nvim-tree.lua/issues/424
api.events.subscribe(api.events.Event.TreeOpen, function()
  vim.wo.statusline = ' '
end)
--view.View.win_opts.relativenumber = false
