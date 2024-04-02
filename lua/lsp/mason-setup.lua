-- Setup installer & lsp configs
local root_pattern = require('lspconfig').util.root_pattern
local mason_ok, mason = pcall(require, 'mason')
local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
local _, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local vim = vim
local jdtls_config = require("lsp.plugins.jdtls").setup
local pid = vim.fn.getpid()

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
    'tsserver',
    'tailwindcss',
    'csharp_ls',
    'cssls',
    'eslint',
    'jdtls',
    --'jsonls',
    'lua_ls',
    'bashls',
    --'html',
    'graphql',
    'prismals',
    'terraformls',
    'apex_ls',
    --'textlsp',
}
mason_lsp.setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig = require('lspconfig')

local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        silent = true,
        border = 'rounded',
    }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            update_in_insert = false,
            underline = true,
        }
    ),
}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local opts = {
    default = {
        -- getting 'on_attach' and capabilities from handlers
        on_attach = require('lsp.handlers').on_attach,
        capabilities = capabilities,
        settings = {
            diagnostics = {
                Lua = {
                    globals = { 'vim' }
                }
            }
        },
        handlers = handlers,
    },
    apex_ls = {
        apex_jar_path = '~/.local/share/nvim/plugins/apex_ls/apex-jorje-lsp.jar',
        apex_enable_semantic_errors = false,       -- Whether to allow Apex Language Server to surface semantic errors
        apex_enable_completion_statistics = false, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
        filetypes = { 'apex', 'apexcode', 'trigger' },
        root_dir = root_pattern('sfdx-project.json'),
    },
    jdtls = jdtls_config,
    csharp_ls = {
        handlers = {
            ["textDocument/definition"] = require('csharpls_extended').handler,
            ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
        },
        cmd = { "csharp-ls" },
    }
}




-- loop through the servers
for _, server in pairs(servers) do
    local lsp_opts = {}
    if opts[server] ~= nil then
        --lsp_opts = opts[server]
        for k, v in pairs(opts[server]) do
            if type(v) == "function" or type(v) == "table" then
                lsp_opts[k] = v
            end
        end
    else
      lsp_opts = opts.default
    end

    -- get the server name
    server = vim.split(server, '@')[1]

    -- pass them to lspconfig
    lspconfig[server].setup(lsp_opts)
    -- reset ls_opts
    lsp_opts = {}
end


--capabilities.textDocument.foldingRange = {
--    dynamicRegistration = false,
--    lineFoldingOnly = true,
--}
--require('plugins.ufo').setup()
