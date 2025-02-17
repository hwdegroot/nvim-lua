return {
  'nvim-treesitter/nvim-treesitter-refactor',
  config = function()
    local treesitter_refactor = require('nvim-treesitter.configs')

    treesitter_refactor.setup({
      refactor = {
        highlight_definitions = {
          enable = true,
          -- Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = true,
        },
        highlight_current_scope = { enable = true },
        smart_rename = {
          enable = true,
          -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
          keymaps = {
            smart_rename = "grr",
          },
        },
        navigation = {
          enable = true,
          -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
          keymaps = {
            list_definitions_toc = "<Leader>gg",
            goto_next_usage = "<Leader>gu",
            goto_previous_usage = "<Leader>gU",
            goto_definition = "<Leader>gd",
            list_definitions = "<Leader>gD",
          },
        },
      }
    })
  end
}
