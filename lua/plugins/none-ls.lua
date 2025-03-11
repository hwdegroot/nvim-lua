local vim = vim

return {
  "nvimtools/none-ls.nvim",
  after = "nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
    "gbprod/none-ls-shellcheck.nvim",
    "davidmh/cspell.nvim",
  },
  config = function()
    require("null-ls").setup({
      debug = true,
      sources = {
        require("null-ls").builtins.hover.printenv,
        require("null-ls").builtins.code_actions.refactoring,
        require("null-ls").builtins.formatting.prettierd.with({
          condition = function(utils)
            return utils.root_has_file({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.yaml",
              ".prettierrc.js",
              "prettier.config.js",
            })
          end,
        }),
        -- https://github.com/nvimtools/none-ls-extras.nvim/tree/main?tab=readme-ov-file#setup
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file({
              ".eslintrc",
              "eslint.config.mjs",
              "eslint.config.cjs",
              "eslint.config.js",
            })
          end,
        }),
        require("null-ls").builtins.formatting.stylua,
        require("none-ls.code_actions.eslint_d"),
        require("none-ls.formatting.eslint_d"),
        -- https://github.com/gbprod/none-ls-shellcheck.nvim
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),
        -- https://github.com/nvimtools/none-ls-extras.nvim?tab=readme-ov-file
        require("none-ls.formatting.jq"),
        require("null-ls").builtins.diagnostics.codespell,
        require("null-ls").builtins.formatting.codespell,
        require("null-ls").builtins.completion.spell,
        -- https://github.com/davidmh/cspell.nvim
        -- For additional configuration: https://cspell.org/configuration/
        require("cspell").code_actions,
        require("cspell").diagnostics.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.HINT
          end,
        }),
      },
      debounce = 200,
    })
  end,
}
