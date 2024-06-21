local utils = require('config.utils')
local nmap, vmap = utils.nmap, utils.vmap
local vim = vim
local M = {}
function M.setup()
  require("gitsigns").setup {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      nmap('<C-]>c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      nmap('<C-[>c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      -- Actions
      nmap('<C-h>s', gs.stage_hunk)
      nmap('<C-h>r', gs.reset_hunk)
      vmap('<C-h>s', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
      vmap('<C-h>r', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
      nmap('<C-h>S', gs.stage_buffer)
      nmap('<C-h>u', gs.undo_stage_hunk)
      nmap('<C-h>R', gs.reset_buffer)
      nmap('<C-h>p', gs.preview_hunk)
      nmap('<C-h>b', function() gs.blame_line { full = true } end)
      nmap('<C-t>b', gs.toggle_current_line_blame)
      nmap('<C-h>d', gs.diffthis)
      nmap('<C-h>D', function() gs.diffthis('~') end)
      nmap('<C-t>d', gs.toggle_deleted)

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

return M
