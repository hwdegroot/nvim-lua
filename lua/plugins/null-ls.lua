local vim = vim
local M = {}
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
--local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local hover = null_ls.builtins.hover
local cspell = require('cspell')

local sources = {
  hover.printenv,
  completion.spell,
  -- For additional configuration: https://cspell.org/configuration/
  -- https://github.com/davidmh/cspell.nvim
  --cspell.diagnostics,
  cspell.code_actions,
  formatting.prettierd.with({
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      --"html",
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
      "cls",
      "apex",
    },
    condition = function(utils)
      return utils.root_has_file({
        '.prettierrc',
        '.prettierrc.json',
        '.prettierrc.yaml',
        '.prettierrc.js',
        'prettier.config.js',
      })
    end
  }),
  -- https://github.com/nvimtools/none-ls-extras.nvim/tree/main?tab=readme-ov-file#setup
  require("none-ls.diagnostics.eslint_d"),
  require("none-ls.formatting.eslint_d"),
  require("none-ls.code_actions.eslint_d").with({
    condition = function(utils)
      return utils.root_has_file({
        '.eslintrc',
        '.eslintrc.js',
        '.eslintrc.cjs',
        '.eslintrc.yaml',
        '.eslintrc.yml',
        '.eslintrc.json',
        'eslint.config.js',
        'eslint.config.cjs',
        'eslint.config.mjs',
        'package.json'
      })
    end
  }),
  -- https://github.com/gbprod/none-ls-shellcheck.nvim
  require("none-ls-shellcheck.diagnostics"),
  require("none-ls-shellcheck.code_actions"),
  -- https://github.com/nvimtools/none-ls-extras.nvim?tab=readme-ov-file
  require("none-ls.formatting.jq"),
}

M.sources = sources

function M.setup()
  null_ls.setup({
    sources = sources
  })
end

return M
