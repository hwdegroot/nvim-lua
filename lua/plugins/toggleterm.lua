return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = {
      {
        "<Leader>T",
        "<cmd>ToggleTerm<CR>",
        desc = "Toggle floating terminal",
        icon = { icon = " ", color = "orange" },
      },
    },
    opts = {
      open_mapping = [[<F4>]],
      direction = "float",
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
    },
  },
}
