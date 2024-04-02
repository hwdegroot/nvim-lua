local vim, utils, lspconfig = vim, require('config.utils'), require('lspconfig')
local M, nmap, nnoremap = {}, utils.nmap, utils.nnoremap

function M.setup()
  lspconfig.ruff_lsp.setup {
    --  https://github.com/astral-sh/ruff-lsp
    init_options = {
      settings = {
        -- Any extra CLI arguments for `ruff` go here.
        args = {},
      }
    }
  }
end

return M

