local root_pattern = require('lspconfig').util.root_pattern
local _, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local vim = vim

local config = {
  apex_jar_path = '~/.local/share/nvim/plugins/apex_ls/apex-jorje-lsp.jar',
  apex_enable_semantic_errors = false,       -- Whether to allow Apex Language Server to surface semantic errors
  apex_enable_completion_statistics = false, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
  filetypes = { 'apex', 'apexcode', 'trigger' },
  root_dir = root_pattern('sfdx-project.json'),
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
}
return config
