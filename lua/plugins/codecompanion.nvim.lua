return {
  "olimorris/codecompanion.nvim",
  opts = {},
  config = function(_, opts)
    --require("codecompanion").setup({
    --  extensions = {
    --    mcphub = {
    --      callback = "mcphub.extensions.codecompanion",
    --      opts = {
    --        show_result_in_chat = true,  -- Show mcp tool results in chat
    --        make_vars = true,            -- Convert resources to #variables
    --        make_slash_commands = true,  -- Add prompts as /slash commands
    --      }
    --    }
    --  },
    --  adapters = {
    --    mistralai = function()
    --      return require("codecompanion.adapters").extend("mistralai", {
    --        env = {
    --          api_key = os.getenv("MISTRALAI_API_KEY"),
    --        },
    --      })
    --    end
    --  },
    --  strategies = {
    --    cmd = {
    --      adapter = "mistralai",
    --    },
    --    chat = {
    --      adapter = "mistralai",
    --    },
    --    inline = {
    --      adapter = {
    --        name = "mistralai",
    --        model = "codestral-2508",
    --      },
    --    },
    --  },
    --})
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
    "nvim-treesitter/nvim-treesitter",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" }
    }
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
  --{
  --  "echasnovski/mini.diff",
  --  config = function()
  --    local diff = require("mini.diff")
  --    diff.setup({
  --      -- Disabled by default
  --      source = diff.gen_source.none(),
  --    })
  --  end,
  --},
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },
}
