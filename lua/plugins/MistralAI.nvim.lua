return {
  enabled = false,
  "hwdegroot/MistralAI.nvim",
  -- icons found in lua/plugins/which-key.nvim.lua
  -- see: https://github.com/LazyVim/LazyVim/discussions/4512
  keys = {
    {
      "<Leader>m",
      group = "mistral.ai",
      desc = "Mistral AI",
    },
    {
      "<Leader>mc",
      "<cmd>ChatGPT<CR>",
      desc = "Chat avec le Chat",
    },
    {
      "<Leader>me",
      "<cmd>ChatGPTEditWithInstruction<CR>",
      desc = "Edit with instruction",
      mode = { "n", "v" },
    },
    {
      "<Leader>mg",
      "<cmd>ChatGPTRun grammar_correction<CR>",
      desc = "Grammar Correction",
      mode = { "n", "v" },
    },
    {
      "<Leader>mt",
      "<cmd>ChatGPTRun translate<CR>",
      desc = "Translate",
      mode = { "n", "v" },
    },
    {
      "<Leader>mk",
      "<cmd>ChatGPTRun keywords<CR>",
      desc = "Keywords",
      mode = { "n", "v" },
    },
    {
      "<Leader>md",
      "<cmd>ChatGPTRun docstring<CR>",
      desc = "Docstring",
      mode = { "n", "v" },
    },
    {
      "<Leader>ma",
      "<cmd>ChatGPTRun add_tests<CR>",
      desc = "Add Tests",
      mode = { "n", "v" },
    },
    {
      "<Leader>mo",
      "<cmd>ChatGPTRun optimize_code<CR>",
      desc = "Optimize Code",
      mode = { "n", "v" },
    },
    {
      "<Leader>ms",
      "<cmd>ChatGPTRun summarize<CR>",
      desc = "Summarize",
      mode = { "n", "v" },
    },
    {
      "<Leader>mf",
      "<cmd>ChatGPTRun fix_bugs<CR>",
      desc = "Fix Bugs",
      mode = { "n", "v" },
    },
    {
      "<Leader>mx",
      "<cmd>ChatGPTRun explain_code<CR>",
      desc = "Explain Code",
      mode = { "n", "v" },
    },
    {
      "<Leader>mr",
      "<cmd>ChatGPTRun roxygen_edit<CR>",
      desc = "Roxygen Edit",
      mode = { "n", "v" },
    },
    {
      "<Leader>ml",
      "<cmd>ChatGPTRun code_readability_analysis<CR>",
      desc = "Code Readability Analysis",
      mode = { "n", "v" },
    },
  },
  config = function()
    local home = vim.fn.expand("$HOME")
    require("chatgpt").setup({
      api_key_cmd = "gpg --decrypt " .. home .. "/.config/mistral.ai/apikey.txt.gpg",
      -- this config assumes you have OPENAI_API_KEY environment variable set
      openai_params = {
        -- NOTE: model can be a function returning the model name
        -- this is useful if you want to change the model on the fly
        -- using commands
        -- Example:
        -- model = function()
        --     if some_condition() then
        --         return "gpt-4-1106-preview"
        --     else
        --         return "gpt-3.5-turbo"
        --     end
        -- end,
        model = "codestral-2501",
        --frequency_penalty = 0,
        --presence_penalty = 0,
        --max_tokens = 4095,
        --temperature = 0.2,
        --top_p = 0.1,
        --n = 1,
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim", -- optional
    "nvim-telescope/telescope.nvim",
  },
}
