local vim = vim
local telescope = require('telescope.builtin')

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<C-p>',  telescope.find_files,           'nvi' },
    { '<C-t>g', telescope.live_grep,            'nvi' },
    { '<C-t>b', telescope.buffers,              'nvi' },
    { '<C-t>h', telescope.help_tags,            'nvi' },
    { '<F2>',   telescope.lsp_references,       'nvi' },
    { '<F4>',   telescope.lsp_implementations,  'nvi' },
    { '<F10>',  telescope.lsp_type_definitions, 'nvi' },
    { '<F12>',  telescope.lsp_definitions,      'nvi' },
    { '<F12>',  vim.lsp.buf.definition,         'n' },
    { '<C-f>',  vim.lsp.buf.declaration,        'n' }
  }
}
