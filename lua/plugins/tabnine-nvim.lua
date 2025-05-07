local plugin_path = vim.fn.stdpath("data") .. "/lazy/tabnine-nvim/"
return {
  "codota/tabnine-nvim",
  build = plugin_path .. "dl_binaries.sh",
  event = "VeryLazy",
  keys = {
  },
  config = function(_, opts)
    require("tabnine").setup({
      disable_auto_comment = true,
      accept_keymap = "<Tab>",
      dismiss_keymap = "<C-]>",
      debounce_ms = 800,
      suggestion_color = { gui = "#808080", cterm = 244 },
      exclude_filetypes = { "TelescopePrompt", "NvimTree" },
      log_file_path = vim.fn.stdpath("log") .. "/tabnine.log", -- absolute path to Tabnine log file
      ignore_certificate_errors = true,
    })
  end,
}
