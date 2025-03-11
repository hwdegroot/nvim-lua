return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, _)
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
