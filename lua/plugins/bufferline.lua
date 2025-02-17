local vim = vim

return {
  'akinsho/bufferline.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' }
  },
  keys = {
    { '<C-Left>',  vim.cmd.bprevious, 'ivn' },
    { '<C-Right>', vim.cmd.bnext,     'ivn' }
  }
}
