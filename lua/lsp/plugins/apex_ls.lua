local root_pattern = require('lspconfig').util.root_pattern
local _, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local vim = vim

local config = {
  -- Make sure that JAVA_HOME is set

  --cmd = {
  --  'java',
  --  '-cp',
  --  '-Ddebug.internal.errors=true',
  --  '-Ddebug.semantic.errors=false',
  --  '-Ddebug.completion.statistics=false',
  --  '-Dlwc.typegeneration.disabled=true',
  --  'apex.jorje.lsp.ApexLanguageServerLauncher'
  --},
  apex_jar_path = '~/local/share/nvim/mason/share/apex-language-server/apex-jorje-lsp.jar',
  apex_enable_semantic_errors = false,       -- Whether to allow Apex Language Server to surface semantic errors
  apex_enable_completion_statistics = false, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
  filetypes = { 'apex', 'apexcode', 'trigger', 'cls' },
  root_dir = root_pattern('sfdx-project.json'),
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

return config
