local vim = vim
local M = {}
--local cspell = require("cspell")
local null_ls = require("null-ls")
--if not null_ls_status_ok then
--    return
--end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

local sources = {
    hover.printenv,
    completion.spell,
    -- For additional configuration: https://cspell.org/configuration/
    --code_actions.cspell,
    code_actions.shellcheck,
    code_actions.eslint_d,


    formatting.eslint_d,
    formatting.ruff,
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

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
    -- https://github.com/streetsidesoftware/cspell
    --diagnostics.cspell.with({
    --    config = {
    --        on_success = function(cspell_config_file)
    --            -- format the cspell config file
    --            os.execute(
    --                string.format(
    --                    "cat %s | jq -S '.words |= sort' | tee %s > /dev/null",
    --                    cspell_config_file,
    --                    cspell_config_file
    --                )
    --            )
    --        end
    --    },
    --}),
    --  setting eslint_d only if we have a eslintrc file in the project
    diagnostics.eslint_d.with({
        condition = function(utils)
            return utils.root_has_file({
                '.eslintrc.js',
                'eslint.config.js',
                '.eslintrc',
            })
        end
    }),
    diagnostics.ruff,
}

M.sources = sources

function M.setup()
    null_ls.setup({
        sources = sources
    })
end

return M
