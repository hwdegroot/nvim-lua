local vim = vim
local pluginpath = vim.fn.stdpath("data") .. "/lazy/cmp-tabnine/"

return {
  'tzachar/cmp-tabnine',
  build = pluginpath .. 'install.sh',
  dependencies = 'hrsh7th/nvim-cmp',
}
