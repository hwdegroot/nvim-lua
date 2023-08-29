local M = {}
local nvimtree, api = require('nvim-tree'), require('nvim-tree.api')

-- https://github.com/nvim-tree/nvim-tree.lua/issues/424
api.events.subscribe(api.events.Event.TreeOpen, function()
    vim.wo.statusline = ' '
end)
--view.View.win_opts.relativenumber = false

function M.setup()
    nvimtree.setup {
        disable_netrw = true,
        hijack_netrw = true,
        git = {
            enable = true,
        },
        renderer = {
            highlight_git = true,
            icons = {
                show = {
                    git = true,
                },
            },
        },
        view = {
            --side = "right",
            number = false,
            relativenumber = false,
        },
        filters = {
        },
    }
end

return M
