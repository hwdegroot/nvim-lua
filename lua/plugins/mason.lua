return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "gitui",
      "ts_ls",
      "omnisharp",
      "csharp_ls",
      "cssls",
      "eslint",
      "java-debug-adapter",
      "java-test",
      "lua_ls",
      "bashls",
      "prismals",
      "apex_ls",
      "cmake",
      "clangd",
      "nginx_language_server",
    },
  },
  config = function(_, opts)
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
    "williamboman/mason-lspconfig.nvim",
  },
}
