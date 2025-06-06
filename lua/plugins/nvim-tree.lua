local vim = vim

return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  priority = 999,
  config = function()
    require('nvim-tree').setup({
      disable_netrw = true,
      hijack_netrw = true,
      git = {
        enable = true,
        ignore = false,
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
        custom = { 'node_modules$' },
      },
    })
  end,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' }
  },
}
