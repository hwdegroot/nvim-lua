return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.ruff.setup({
      --  https://github.com/astral-sh/ruff-lsp
      init_options = {
        settings = {
          -- Any extra CLI arguments for `ruff` go here.
          args = {},
        }
      }
    })
  end
}
