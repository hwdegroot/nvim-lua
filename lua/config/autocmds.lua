-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local autocmd = vim.api.nvim_create_autocmd

-- autocmd({ "Syntax" }, { pattern = "*", command = "syn match ExtraWhitespace /\\s\\+$\\| \\+\\ze\\t/" })
autocmd({ "ColorScheme" }, { pattern = "*", command = "highlight ExtraWhitespace ctermbg=red guibg=red" })
autocmd({ "BufWritePre" }, { pattern = "*", command = "%s/\\s\\+$//e" })

autocmd({ "FileType" }, {
  desc = "Use tabs in nginx config files",
  pattern = { "nginx" },
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.expandtab = false
  end,
})

-- In Makefiles use tabs
autocmd({ "FileType" }, {
  desc = "Use tabs makefile",
  pattern = { "make" },
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.expandtab = false
  end,
})

-- Set tabs and spaces for dotnet csproj files
-- Disable autoformat for lua files
autocmd({ "FileType", "BufRead", "BufEnter", "BufNewFile" }, {
  desc = "Set tabwith to 4 for specific filetypes",
  pattern = { "*.csproj", "php", "python", "*.py" },

  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.expandtab = true
  end,
})


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
      vim.diagnostic.enable(false, { bufnr = args.buf })
    end
  end,
})

-- Add gitconfig highlighting for file.gitconfig
-- Add sshconfig highlighting for file.sshconfig
vim.filetype.add({
  extension = {
    gitconfig = "gitconfig",
    sshconfig = "sshconfig",
    env = "sh",
    releaserc = "json",
    mustache = "html",
  },
  filename = {
    [".env"] = "sh"
  },
  pattern = {
    ["^.env$"] = "sh",
    ["^.env%.local$"] = "sh",
    ["^.env%.example$"] = "sh",
    ["^.env%.dev$"] = "sh",
    ["^.env%.prod$"] = "sh",
  }
})
