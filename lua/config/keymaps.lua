local vim = vim
local utils = require('config.utils')
local xmap, nmap, imap = utils.xmap, utils.nmap, utils.imap
local builtin = require('telescope.builtin')

-- remap leader key
vim.g.mapleader = '\\'

-- telescope search
local telescope = require('telescope.builtin')
xmap('<C-p>', telescope.find_files)
xmap('<C-t>g', telescope.live_grep)
xmap('<C-t>b', telescope.buffers)
xmap('<C-t>h', telescope.help_tags)

-- nvim-tree
xmap('<C-n>', vim.cmd.NvimTreeToggle)

-- Undo tree
xmap('<C-u>', vim.cmd.UndotreeToggle)

-- Navigating through splits and tabs
xmap('<C-Left>', vim.cmd.bprevious)
xmap('<C-Right>', vim.cmd.bnext)
xmap('<C-S-Up>', '<C-w>k')
xmap('<C-S-Down>', '<C-w>j')
xmap('<C-S-Left>', '<C-w>h')
xmap('<C-S-Right>', '<C-w>l')

-- Fix random character navigation
xmap('<Esc>[1;5A', '<C-Up>')
xmap('<Esc>[1;5B', '<C-Down>')
--xmap('<Esc>[1;5C', '<C-Right>')
--xmap('<Esc>[1;5D', '<C-Left>')
xmap('<Esc>[1;2A', '<S-Up>')
xmap('<Esc>[1;2B', '<S-Down>')
xmap('<Esc>[0;2C', '<S-Right>')
xmap('<Esc>[1;2D', '<S-Left>')

-- Move lines up and down
nmap('<C-Down>', ':m .+1<CR>==')
nmap('<C-Up>', ':m .-2<CR>==')

-- close buffers
nmap('ZZ', ':qa!<CR>')
nmap('zz', ':wq<CR>')

-- Mergetooling in git diff
nmap('<leader>r', ':diffg RE<CR>', { silent = false })
nmap('<leader>l', ':diffg LO<CR>', { silent = false })
nmap('<leader>n', ']c', { silent = false })
nmap('<leader>p', '[c', { silent = false })

-- Folding
--nmap('zr', ':foldclose<CR>')
--nmap('zR', ':foldopen<CR>')

-- Spell checking
-- https://gcman105.medium.com/neovim-nvim-spell-checking-cc1c0d11dc1b
nmap('<F3>', ':set spell!<CR>')
imap('<F3>', '<C-O>:set spell!')

vim.api.nvim_set_keymap('n', '<C-space>', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
