local lspconfig = require('lspconfig')
local M = {}

function M.setup()
  lspconfig.ruff.setup {
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
