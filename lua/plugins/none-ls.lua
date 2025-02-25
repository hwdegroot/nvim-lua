local vim = vim

return {
  'nvimtools/none-ls.nvim',
  after = 'nvim-lspconfig',
  config = function()
    require('null-ls').setup({
      sources = {
        require('null-ls').builtins.hover.printenv,
        require('null-ls').builtins.completion.spell,
        -- For additional configuration: https://cspell.org/configuration/
        -- https://github.com/davidmh/cspell.nvim
        --cspell.diagnostics,
        require('cspell').code_actions,
        require('null-ls').builtins.formatting.prettierd.with({
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
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file({
              '.eslintrc',
              'eslint.config.mjs',
              'eslint.config.cjs',
              'eslint.config.js',
            })
          end
        }),
        require("none-ls.code_actions.eslint_d"),
        require("none-ls.formatting.eslint_d"),
        -- https://github.com/gbprod/none-ls-shellcheck.nvim
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions").with({
          filetypes = { "sh", ".env", ".env.*" },
        }),
        -- https://github.com/nvimtools/none-ls-extras.nvim?tab=readme-ov-file
        require("none-ls.formatting.jq"),
      }
    })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'davidmh/cspell.nvim',
    'nvimtools/none-ls-extras.nvim',
    'gbprod/none-ls-shellcheck.nvim',
  },
}
