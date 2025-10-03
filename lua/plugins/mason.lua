return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "gitui",
      "ts_ls",
      "omnisharp",
      "csharp_ls",
      "csharpier",
      "cssls",
      "delve",
      "eslint",
      "goimports",
      "gofumpt",
      "gomodifytags",
      "impl",
      "java-debug-adapter",
      "java-test",
      "lua_ls",
      "bashls",
      "prismals",
      "apex_ls",
      "cmake",
      "clangd",
      "netcoredbg",
      "nginx_language_server",
      "sonarlint-language-server",
    },
  },
  config = function(_, _)
    require("mason").setup({
      ui = {
        -- The border to use for the UI window.
        -- Accepts same border values as |nvim_open_win()|.
        border = "rounded",
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    })
  end,
  -- :MasonUpdate updates registry contents
  build = ":MasonUpdate",
  {
    "mason-org/mason-lspconfig.nvim",
    config = function() end,
  },
}
