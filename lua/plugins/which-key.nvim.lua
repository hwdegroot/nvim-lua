return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    table.insert(opts.spec, {
      "<leader>m",
      desc = "+tabnine",
      group = "tabnine",
      icon = {
        icon = LazyVim.config.icons.kinds.TabNine,
        color = "red",
      },
    })
    table.insert(opts.spec, {
      "<Leader>mc",
      "<cmd>TabnineChat<CR>",
      desc = "TabNine Chat",
      icon = {
        icon = " ",
        color = "white",
      },
    })
    table.insert(opts.spec, {
      "<Leader>mf",
      "<cmd>TabnineFix<CR>",
      desc = "TabNine Fix Code",
      mode = { "n", "v" },
      icon = {
        icon = " ",
        color = "blue",
      },
    })
    table.insert(opts.spec, {
      "<Leader>mt",
      "<cmd>TabnineTest<CR>",
      desc = "Tabnine Write Tests",
      mode = { "n", "v" },
      icon = {
        icon = " ",
        color = "green",
      },
    })
    table.insert(opts.spec, {
      "<Leader>me",
      "<cmd>TabnineExplain<CR>",
      desc = "TabNine Explain Code",
      mode = { "n", "v" },
      icon = {
        icon = " ",
        color = "yellow",
      },
    })
  end,
}
