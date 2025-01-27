-- optimizations
local vim = vim
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "Syntax" }, { pattern = "*", command = "syn match ExtraWhitespace /\\s\\+$\\| \\+\\ze\\t/" })
autocmd({ "ColorScheme" }, { pattern = "*", command = "highlight ExtraWhitespace ctermbg=red guibg=red" })
autocmd({ "BufWritePre" }, { pattern = "*", command = "%s/\\s\\+$//e" })
--vim.cmd[[
--au Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/'
--au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red'
--au BufWritePre * :%s/\s\+$//e
--]]

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
      vim.diagnostic.disable(args.buf)
    end
  end,
})
