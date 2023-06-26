local packer = require('packer')

vim.cmd [[packadd packer.nvim]]
packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function ()
            require('dashboard').setup()
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    use 'mbbill/undotree'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use 'haishanh/night-owl.vim'

    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    -- bufferline
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    --use {
    --    'willothy/nvim-cokeline',
    --    requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    --    config = function()
    --        require('plugins.cokeline')
    --    end
    --}

    -- code completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('plugins.cmp')
        end,
        requires = {
            'onsails/lspkind.nvim',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
    }

    use {
        'williamboman/mason.nvim',
        run = ':MasonUpdate', -- :MasonUpdate updates registry contents
        'williamboman/mason-lspconfig.nvim',
    }

    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- Fonts and themes
    use { 'ellisonleao/gruvbox.nvim' }
    use { 'tanvirtin/monokai.nvim' }
    use { 'sainnhe/sonokai' }

    -- statusline
    use({
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = function()
            require('plugins.eviline')
        end,
        -- some optional icons
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true,
    --        'folke/tokyonight.nvim'
        },
    })


end)


require('plugins.sign').setup()
require('plugins.nvimtree').setup()
require('plugins.devicons').setup()
require("plugins.bufferline").setup{}
 -- require('plugins.ufo') -> this is called in lsp.setup


require('plugins.lsp').setup()
