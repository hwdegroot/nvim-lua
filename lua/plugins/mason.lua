return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "gitui",
    },
  },
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("lsp.mason-setup").setup()
    end,
  },
}
