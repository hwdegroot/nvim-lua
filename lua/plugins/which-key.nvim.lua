return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.icons = {
      rules = {
        { pattern = "mistral ai", icon = " ", color = "blue" },
        { pattern = "chat avec le chat", icon = " ", color = "orange" },
        { pattern = "ask le chat", icon = " ", color = "white" },
        { pattern = "review code", icon = " ", color = "blue" },
        { pattern = "enhance code", icon = " ", color = "green" },
        { pattern = "change code", icon = " ", color = "orange" },
        { pattern = "summarize text", icon = " ", color = "blue" },
        { pattern = "generate text", icon = " ", color = "blue" },
        { pattern = "change text", icon = " ", color = "blue" },
        { pattern = "enhance spelling", icon = " ", color = "blue" },
        { pattern = "enhance wording", icon = " ", color = "yellow" },
        { pattern = "make concise", icon = " ", color = "green" },
        { pattern = "make list", icon = " ", color = "green" },
        { pattern = "make table", icon = " ", color = "red" },
      },
    }
  end,
}
