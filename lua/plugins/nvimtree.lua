local M = {}
local nvimtree, api = require('nvim-tree'), require('nvim-tree.api')

-- https://github.com/nvim-tree/nvim-tree.lua/issues/424
api.events.subscribe(api.events.Event.TreeOpen, function ()
    vim.wo.statusline = ' '
end)
--view.View.win_opts.relativenumber = false

function M.setup()
    nvimtree.setup {
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            number = false,
            relativenumber = false,
        },
        filters = {
            custom = { ".git" },
        },
    }
end

return M
