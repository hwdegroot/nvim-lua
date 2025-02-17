local vim = vim
--local gs = package.loaded.gitsigns

return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require("gitsigns").setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map(
        'n',
        '<C-]>c',
        function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end
        )

        map(
        'n',
        '<C-[>c',
        function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end
        )

        -- Actions
        map('n', '<C-h>s', gs.stage_hunk)
        map('n', '<C-h>r', gs.reset_hunk)
        map('v', '<C-h>s', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<C-h>r', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<C-h>S', gs.stage_buffer)
        map('n', '<C-h>u', gs.undo_stage_hunk)
        map('n', '<C-h>R', gs.reset_buffer)
        map('n', '<C-h>p', gs.preview_hunk)
        map('n', '<C-h>b', function() gs.blame_line { full = true } end)
        map('n', '<C-t>b', gs.toggle_current_line_blame)
        map('n', '<C-h>d', gs.diffthis)
        map('n', '<C-h>D', function() gs.diffthis('~') end)
        map('n', '<C-t>d', gs.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      sign_priority = 6,
      status_formatter = nil,
      update_debounce = 100,
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor"
      }
    }
  end
}
