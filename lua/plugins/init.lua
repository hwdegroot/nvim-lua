local packer = require('packer')

vim.cmd([[packadd packer.nvim]])
packer.startup(function(use)
    use('wbthomason/packer.nvim')

    use({
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup()
        end,
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    })

    -- file search
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = {
            'nvim-lua/plenary.nvim',
        },
    })

    -- file browser
    use({
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    })

    -- git
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')

    -- bufferline
    use({
        'akinsho/bufferline.nvim',
        tag = '*',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    })

    -- code completion nvim-cmp
    use('neovim/nvim-lspconfig')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/cmp-calc')
    use({
        'hrsh7th/nvim-cmp',
        config = function()
            require('plugins.cmp')
        end,
        requires = {
            'onsails/lspkind.nvim',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'David-Kunz/cmp-npm',
        },
    })
    -- terraform
    use('hashicorp/terraform-ls')

    -- copilot and AI tools
    --use('github/copilot.vim')
    use({
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        config = function()
            require('copilot').setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    })
    use({
        'zbirenbaum/copilot-cmp',
        after = 'copilot.lua',
        config = function()
            require('copilot_cmp').setup({ })
        end,
    })
    use({
        'tzachar/cmp-tabnine',
        run = './install.sh',
        requires = 'hrsh7th/nvim-cmp',
    })

    -- Automatic language servers for code completion
    use({
        'williamboman/mason.nvim',
        run = ':MasonUpdate', -- :MasonUpdate updates registry contents
        'williamboman/mason-lspconfig.nvim',
    })

    -- smart folding
    use({
        'kevinhwang91/nvim-ufo',
        requires = {
            'kevinhwang91/promise-async',
        },
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    })

    -- Fonts, themes and colorscehemes
    use({ 'ellisonleao/gruvbox.nvim' })
    use({ 'tanvirtin/monokai.nvim' })
    use({ 'sainnhe/sonokai' })
    --  use 'haishanh/night-owl.vim'

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
        },
    })

    -- null-ls
    use({
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('null-ls').setup()
        end,
        requires = { 'nvim-lua/plenary.nvim' },
    })
end)

require('plugins.sign').setup()
require('plugins.nvimtree').setup()
require('plugins.devicons').setup()
require('plugins.bufferline').setup()
require('plugins.cmp-npm').setup()
require('plugins.ufo').setup()
