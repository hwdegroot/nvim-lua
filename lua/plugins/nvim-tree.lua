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
    })
  end,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' }
  },
  keys = {
    { '<C-n>',      vim.cmd.NvimTreeToggle,                       'nvi' },
    { '<C-S-Up',    function() vim.cmd.NvimTreeResize('20') end,  'n' },
    { '<C-S-Down>', function() vim.cmd.NvimTreeResize('-20') end, 'n' }
  }
}
