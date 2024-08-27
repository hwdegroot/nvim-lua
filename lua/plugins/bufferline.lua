local utils = require('config.utils')
local xmap = utils.xmap
local M = {}

M.setup = function ()
    require("bufferline").setup{}
    xmap('<C-Left>', vim.cmd.bprevious)
    xmap('<C-Right>', vim.cmd.bnext)
end

return M
