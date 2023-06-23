local xmap = require "settings.utils".xmap


-- telescope search
local telescope = require('telescope.builtin')
xmap('<C-f>', telescope.find_files)
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
xmap('<Esc>[1;5C', '<C-Right>')
xmap('<Esc>[1;5D', '<C-Left>')
xmap('<Esc>[1;2A', '<S-Up>')
xmap('<Esc>[1;2B', '<S-Down>')
xmap('<Esc>[0;2C', '<S-Right>')
xmap('<Esc>[1;2D', '<S-Left>')

-- Move lines up and down
xmap('<C-Down>', 'm .+1<CR>==')
xmap('<C-Up>', 'm .-2<CR>==')

--nnoremap <C-l> :buffers!<CR>:buffer<Space>
--noremap <silent> <C-d>b :diffg BA<CR>
--noremap <silent> <C-d>r :diffg RE<CR>
--noremap <silent> <C-d>l :diffg LO<CR>
--
--map <C-c> :bd<CR>:wincmd l<CR>
--nmap <Leader>v :vsplit<CR>
--nmap <Leader>h :split<CR>
--map <Leader>c ^I//<Esc>
--nmap <silent> <Leader><Up> :wincmd k<CR>
--nmap <silent> <Leader><Down> :wincmd j<CR>
--nmap <silent> <Leader>h :wincmd h<CR>
--nmap <silent> <Leader>l :wincmd l<CR>
--map <silent> <Leader>s :so $MYVIMRC<CR>:wincmd l<CR>
--map <silent> <Leader>$ :e $MYVIMRC<CR>
--

