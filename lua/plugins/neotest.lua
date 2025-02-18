return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Test adapters
    "Issafalcon/neotest-dotnet",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-python",
    { 'thenbe/neotest-playwright', dependencies = 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require("neotest-dotnet"),
        require("neotest-rust"),
        require("neotest-python"),
        require('neotest-playwright').adapter({
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        }),
      }
    })
  end,
  keys = {
    { '<Leader>tr', ':lua require("neotest").run.run()<CR>',                     'n' },
    { '<Leader>tR', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',   'n' },
    { '<Leader>tD', ':lua require("neotest").run.run({ strategy = "dap" })<CR>', 'n' },
    { '<Leader>tQ', ':lua require("neotest").run.stop()<CR>',                    'n' },
    { '<Leader>tA', ':lua require("neotest").run.run_all()<CR>',                 'n' },
    { '<Leader>tt', ':lua require("neotest").run.attach()<CR>',                  'n' }
  },
}
