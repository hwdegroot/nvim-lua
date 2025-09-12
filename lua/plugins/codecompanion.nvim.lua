return {
  "olimorris/codecompanion.nvim",
  opts = {
    opts = {
      log_level = "TRACE",
    }
  },
  config = function(_, _)
    require("codecompanion").setup({
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            show_result_in_chat = true,  -- Show mcp tool results in chat
            make_vars = true,            -- Convert resources to #variables
            make_slash_commands = true,  -- Add prompts as /slash commands
          }
        }
      },
      adapters = {
        http = {
          mistral = function()
            local api_key = os.getenv("MISTRAL_API_KEY")
            return require("codecompanion.adapters").extend("mistral", {
              env = {
                api_key = api_key,
              },
            })
          end
        }
      },
      strategies = {
        cmd = {
          adapter = {
            name = "mistral",
            model = "codestral-latest",
          },
        },
        chat = {
          adapter = {
            name = "mistral",
            model = "codestral-latest",
          },
        },
        inline = {
          adapter = {
            name = "mistral",
            model = "codestral-latest",
          },
        },
      },
    })
  end,
}
