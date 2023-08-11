local vim = vim
local M = {}
--local cspell_status_ok, cspell = pcall(require, "cspell")
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
    -- https://github.com/streetsidesoftware/cspell
    --diagnostics.cspell,
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
    -- For additional configuration: https://cspell.org/configuration/
    code_actions.cspell,
    --formatting.prettier,
    -- setting eslint_d only if we have a eslintrc file in the project
    diagnostics.eslint_d.with({
        condition = function(utils)
            return utils.root_has_file({ '.eslintrc.js', 'eslint.config.js', '.eslintrc' })
        end
    }),
}

function M.setup()
    null_ls.setup()
    --null_ls.setup({
    --    debug = false,
    --    sources = sources,
    --})
end

return M
