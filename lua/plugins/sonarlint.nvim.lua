return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  after = { "neovim/nvim-lspconfig" },
  event = "VeryLazy",
  config = function()
    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          -- Ensure that sonarlint-language-server uses stdio channel
          "-stdio",
          "-analyzers",
          -- paths to the analyzers you need, using those for python and java in this example
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcsharp.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarlintomnisharp.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarxml.jar"),
        },
        init_options = {
          omnisharpDirectory = vim.fn.expand("$MASON/packages/sonarlint-language-server/extension/omnisharp"),
          csharpOssPath = vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcsharp.jar"),
          csharpEnterprisePath = vim.fn.expand("$MASON/share/sonarlint-analyzers/csharpenterprise.jar"),
        },
      },
      filetypes = {
        "cs",
        "js",
        "csproj",
        "xml",
      },
    })
  end,
}
