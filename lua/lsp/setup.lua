-- Setup installer & lsp configs
local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not mason_ok or not mason_lsp_ok then
    return
end

mason.setup({
    ui = {
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = 'rounded'
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
})

-- Order matters
local servers = {
    "tsserver",
    "tailwindcss",
    "cssls",
    "eslint",
    "jsonls",
    "lua_ls",
    "bashls",
    "html",
    "graphql",
    "prismals",
}
mason_lsp.setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig = require("lspconfig")

local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        silent = true,
        border = 'rounded',
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = true,
            update_in_insert = false,
            underline = true,
        }
    ),
}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local opts = {}

-- loop through the servers
for _, server in pairs(servers) do
    opts = {
        -- getting "on_attach" and capabilities from handlers
        on_attach = require('lsp.handlers').on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        },
        handlers = handlers,
    }

    -- get the server name
    server = vim.split(server, "@")[1]

    -- pass them to lspconfig
    lspconfig[server].setup(opts)
end


--capabilities.textDocument.foldingRange = {
--    dynamicRegistration = false,
--    lineFoldingOnly = true,
--}
--require('plugins.ufo').setup()

