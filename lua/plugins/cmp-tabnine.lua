local plugin_path = vim.fn.stdpath("data") .. "/lazy/cmp-tabnine/"

return {
  'tzachar/cmp-tabnine',
  build = plugin_path .. 'install.sh',
  dependencies = 'hrsh7th/nvim-cmp',
}
