local packer, vim = require('packer'), vim

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
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

    -- silver searcher
    use({
        "rking/ag.vim"
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
    use('hashivim/vim-terraform')

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
            require('copilot_cmp').setup({})
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

    use({
        'nvim-treesitter/nvim-treesitter-refactor',
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
        "nvimtools/none-ls.nvim",
        after = "nvim-lspconfig",
        config = function()
            require("plugins.null-ls").setup()
        end,
        requires = {
            "nvim-lua/plenary.nvim",
            "davidmh/cspell.nvim"
        },

    })

    use({
        "MunifTanjim/prettier.nvim"
    })

    use({
        "prisma/vim-prisma"
    })

    use({
        "lvimuser/lsp-inlayhints.nvim",
    })
    use({
        "vim-test/vim-test",
        --config = function()
        --    require('nvim-test').setup()
        --end
    })

    -- toggle term
    use({
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    })
    use({ "uiiaoo/java-syntax.vim" })
    use({ "ejholmes/vim-forcedotcom" })

    -- Eclipse java
    use({ "mfussenegger/nvim-jdtls" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)



require('plugins.sign').setup()
require('plugins.nvimtree').setup()
require('plugins.devicons').setup()
require('plugins.bufferline').setup()
require('plugins.cmp-npm').setup()
require('plugins.ufo').setup()
require('plugins.treesitter-refactor')
require("plugins.lsp-inlayhints").setup()
