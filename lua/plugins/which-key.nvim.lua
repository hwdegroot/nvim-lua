return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.icons = {
      rules = {
        { pattern = "mistral ai", icon = " ", color = "blue" },
        { pattern = "chat avec le chat", icon = " ", color = "orange" },
        { pattern = "edit with instruction", icon = " ", color = "blue" },
        { pattern = "grammar correction", icon = " ", color = "blue" },
        { pattern = "translate", icon = " ", color = "blue" },
        { pattern = "keywords", icon = " ", color = "yellow" },
        { pattern = "docstring", icon = " ", color = "green" },
        { pattern = "add tests", icon = " ", color = "green" },
        { pattern = "optimize code", icon = " ", color = "orange" },
        { pattern = "summarize", icon = " ", color = "white" },
        { pattern = "fix bugs", icon = " ", color = "red" },
        { pattern = "explain code", icon = " ", color = "orange" },
        { pattern = "roxygen edit", icon = " ", color = "purple" },
        { pattern = "code readability analysis", icon = " ", color = "blue" },
      },
    }
  end,
}
