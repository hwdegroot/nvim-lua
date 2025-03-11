local _, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local vim = vim

local config = {
  handlers = {
    ["textDocument/definition"] = require('csharpls_extended').handler,
    ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
  },
  cmd = { "csharp-ls" },
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

return config
