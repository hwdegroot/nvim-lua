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

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    use {
        'willothy/nvim-cokeline',
        requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
        config = function()
            require('plugins.cokeline').setup()
        end
    }

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use {
        'williamboman/mason.nvim',
        run = ':MasonUpdate', -- :MasonUpdate updates registry contents
        'williamboman/mason-lspconfig.nvim',
    }

    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use { "ellisonleao/gruvbox.nvim" }

end)

--require('plugins.lualine').setup()
require('plugins.lualine').setup()

require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

require('plugins.sign').setup()
require('plugins.nvimtree').setup()
require('plugins.devicons').setup()
--require('plugins.indent').setup()

