-- Diagnostic config
local icons, vim = require('config.icons').diagnostics, vim
local codes = {
    -- Lua
    no_matching_function = {
        message = " Can't find a matching function",
        "redundant-parameter",
        "ovl_no_viable_function_in_call",
    },
    empty_block = {
        message = " That shouldn't be empty here",
        "empty-block",
    },
    missing_symbol = {
        message = " Here should be a symbol",
        "miss-symbol",
    },
    expected_semi_colon = {
        message = " Please put the `;` or `,`",
        "expected_semi_declaration",
        "miss-sep-in-table",
        "invalid_token_after_toplevel_declarator",
    },
    redefinition = {
        message = " That variable was defined before",
        icon = " ",
        "redefinition",
        "redefined-local",
        "no-duplicate-imports",
        "@typescript-eslint/no-redeclare",
        "import/no-duplicates"
    },
    no_matching_variable = {
        message = " Can't find that variable",
        icon = " ",
        "undefined-global",
        "reportUndefinedVariable",
    },
    trailing_whitespace = {
        message = "  Whitespaces are useless",
        "trailing-whitespace",
        "trailing-space",
    },
    unused_variable = {
        message = "  Don't define variables you don't use",
        icon = "  ",
        "unused-local",
        "@typescript-eslint/no-unused-vars",
        "no-unused-vars"
    },
    unused_function = {
        message = "  Don't define functions you don't use",
        "unused-function",
    },
    useless_symbols = {
        message = " Remove that useless symbols",
        "unknown-symbol",
    },
    wrong_type = {
        message = " Try to use the correct types",
        "init_conversion_failed",
    },
    undeclared_variable = {
        message = " Have you delcared that variable somewhere?",
        "undeclared_var_use",
    },
    lowercase_global = {
        message = " Should that be a global? (if so make it uppercase)",
        "lowercase-global",
    },
    -- Typescript
    no_console = {
        icon = "  ",
        "no-console",
    },
    -- Prettier
    prettier = {
        icon = "  ",
        "prettier/prettier"
    }
}

vim.diagnostic.config({
    float = {
        source = "if_many",
        format = function(diagnostic)
            if not diagnostic then
                return ""
            end
            local code = diagnostic.user_data and diagnostic.user_data.lsp and diagnostic.user_data.lsp.code or nil

            if not diagnostic.source or not code then
                return string.format('%s', diagnostic.message)
            end

            for _, table in pairs(codes) do
                if vim.tbl_contains(table, code) then
                    return string.format('%s [%s]', (table.icon or '') .. diagnostic.message, code)
                end
            end


            for _, table in pairs(codes) do
                if vim.tbl_contains(table, code) then
                    return string.format('%s [%s]', (table.icon or '') .. table.message, code)
                end
            end

            return string.format('%s [%s]', diagnostic.message, diagnostic.source)
        end
    },
    severity_sort = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    virtual_text = {
        source = "always", --"always",  -- Or "if_many"
        prefix = '●', -- '▎', 'x' '●',
    }
})

-- UI
for type, icon in pairs(icons) do
    local hl = "DiagnosticSign" .. type:gsub("^%l", string.upper)
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require('lspconfig.ui.windows').default_options.border = 'rounded'
