return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = {
        "go",
        "java",
        "c_sharp",
      }
      vim.filetype.add({
        extension = {
          cls = "apex",
          apex = "apex",
          trigger = "apex",
          soql = "soql",
          sosl = "sosl",
          log = "sflog",
        },
      })
    end,
  },
}
