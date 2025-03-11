-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local autocmd = vim.api.nvim_create_autocmd
vim.api.nvim_create_user_command("LspToggleAutoFormat", 'lua require("lsp.functions").toggle_format_on_save()', {})

autocmd({ "Syntax" }, { pattern = "*", command = "syn match ExtraWhitespace /\\s\\+$\\| \\+\\ze\\t/" })
autocmd({ "ColorScheme" }, { pattern = "*", command = "highlight ExtraWhitespace ctermbg=red guibg=red" })
autocmd({ "BufWritePre" }, { pattern = "*", command = "%s/\\s\\+$//e" })

-- lsp diagnostics
--vim.cmd('autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, border="rounded"})')
autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim and vim.diagnostic then
      vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
    end
  end,
})

-- Disable shellcheck for env files
local group = vim.api.nvim_create_augroup("__env", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = ".env*",
  group = group,
  callback = function(args)
    if vim and vim.diagnostic then
      vim.diagnostic.enable(false, args.buf)
    end
  end,
})
