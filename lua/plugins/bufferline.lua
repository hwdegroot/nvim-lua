local utils = require('config.utils')
local xmap, nmap = utils.xmap, utils.nmap
local M = {}

M.setup = function ()
    require("bufferline").setup{}
    xmap('<C-Left>', vim.cmd.bprevious)
    xmap('<C-Right>', vim.cmd.bnext)
end

return M
