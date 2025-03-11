-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
-- Dap
keymap("n", "<S-F5>", ":DapTerminate<CR>", { silent = false })
keymap("n", "<F5>", require("dap").continue, { silent = false })
keymap("n", "<F6>", require("dap").step_over, { silent = false })
keymap("n", "<F7>", require("dap").step_into, { silent = false })
keymap("n", "<F8>", require("dap").step_out, { silent = false })
keymap("n", "<Leader>B", require("dap").toggle_breakpoint, { silent = false })
keymap("n", "<Leader>dr", require("dap").repl.open, { silent = false })
keymap("n", "<Leader>dl", require("dap").run_last, { silent = false })

-- navigation
--keymap({ "n", "i", "v" }, "<C-Left>", vim.cmd.bprevious)
--keymap({ "n", "i", "v" }, "<C-Right>", vim.cmd.bnext)
--keymap({ "n", "i", "v" }, "<C-S-Up>", "<C-w>k")
--keymap({ "n", "i", "v" }, "<C-S-Down>", "<C-w>j")
--keymap({ "n", "i", "v" }, "<C-S-Left>", "<C-w>h")
--keymap({ "n", "i", "v" }, "<C-S-Right>", "<C-w>l")

-- Spell checking
-- https://gcman105.medium.com/neovim-nvim-spell-checking-cc1c0d11dc1b
keymap({ "n", "i" }, "<F3>", ":set spell!<CR>")
keymap("n", "<C-space>", "<cmd>lua vim.diagnostic.setloclist()<CR>", { noremap = true, silent = true })
