local vim = vim

return {
  'mbbill/undotree',
  keys = {
    { '<C-u>', vim.cmd.UndotreeToggle, 'vni' }
  }
}
