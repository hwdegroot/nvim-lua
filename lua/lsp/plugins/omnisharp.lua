local root_pattern = require('lspconfig').util.root_pattern
local vim = vim
local pid = vim.fn.getpid()
local merge = require('config.utils').merge
local csarpls = require('lsp.plugins.csharp_ls')


local config = {
  --cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
  root_dir = root_pattern('*.sln'),
  on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local keymap_opts = { noremap = true, silent = true }
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>D',
      '<cmd>lua require("omnisharp_extended").telescope_lsp_type_definition()<CR>', { noremap = true })
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>d',
      '<cmd>lua require("omnisharp_extended").telescope_lsp_definition({ jump_type = "vsplit" })<CR>',
      { nnoremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>r',
      '<cmd>lua require("omnisharp_extended").telescope_lsp_references()<cr>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>i',
      '<cmd>lua require("omnisharp_extended").telescope_lsp_implementation()<cr>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
      keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', keymap_opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
      '<cmd>lua require("omnisharp_extended").telescope_lsp_references()<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', keymap_opts)
  end
}

-- https://github.com/Decodetalkers/csharpls-extended-lsp.nvim?tab=readme-ov-file
-- Append to the omnisharp config
return merge(config, csarpls)
