return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofumpt" },
      cs = { "csharpier" },
    },
  },
  formatters = {
    csharpier = {
      command = "dotnet-csharpier",
      args = { "--write-stdout" },
    },
  },
}
