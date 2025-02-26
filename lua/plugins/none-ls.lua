local vim = vim

return {
  'nvimtools/none-ls.nvim',
  --after = 'nvim-lspconfig',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'davidmh/cspell.nvim',
    'nvimtools/none-ls-extras.nvim',
    'gbprod/none-ls-shellcheck.nvim',
  },
}
