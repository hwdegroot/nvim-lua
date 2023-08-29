local nmap, vim = require("config.utils").nmap, vim
local treesitter_refactor = require('nvim-treesitter.configs')

treesitter_refactor.setup({
    refactor = {
        --highlight_current_scope = { enable = true },
        smart_rename = {
            enable = true,
            -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
            keymaps = {
                smart_rename = "grr",
            },
        },
        navigation = {
            enable = true,
            -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
            keymaps = {
                list_definitions_toc = "<Leader>gg",
                goto_next_usage = "<Leader>gu",
                goto_previous_usage = "<Leader>gU",
            },
        },
    }
})

nmap("<Leader>gD", '<cmd>lua vim.lsp.buf.declaration()<CR>')
nmap("<Leader>gd", '<cmd>lua vim.lsp.buf.definition()<CR>')
