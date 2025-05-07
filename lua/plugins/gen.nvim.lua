return {
  "hwdegroot/gen.nvim",
  branch = "mistral-api",
  keys = {
    {
      "<Leader>m",
      group = "mistral.ai",
      desc = "Mistral AI",
    },
    {
      "<Leader>mc",
      "<cmd>Gen Chat<CR>",
      desc = "Chat avec le Chat",
    },
    {
      "<Leader>ma",
      "<cmd>Gen Ask<CR>",
      desc = "Ask le Chat",
      mode = { "n", "v" },
    },
    {
      "<Leader>mr",
      "<cmd>Gen Review_Code<CR>",
      desc = "Review Code",
      mode = { "n", "v" },
    },
    {
      "<Leader>me",
      "<cmd>Gen Enhance_Code<CR>",
      desc = "Enhance Code",
      mode = { "n", "v" },
    },
    {
      "<Leader>mu",
      "<cmd>Gen Change_Code<CR>",
      desc = "Change Code",
      mode = { "n", "v" },
    },
    {
      "<Leader>ms",
      "<cmd>Gen Summarize<CR>",
      desc = "Summarize text",
      mode = { "n", "v" },
    },
    {
      "<Leader>mm",
      "<cmd>Gen Generate<CR>",
      desc = "Generate text",
      mode = { "n", "v" },
    },
    {
      "<Leader>mn",
      "<cmd>Gen Change<CR>",
      desc = "Change text",
      mode = { "n", "v" },
    },
    {
      "<Leader>mg",
      "<cmd>Gen Enhance_Grammar_Spelling<CR>",
      desc = "Enhance spelling",
      mode = { "n", "v" },
    },
    {
      "<Leader>mw",
      "<cmd>Gen Enhance_Wording<CR>",
      desc = "Enhance wording",
      mode = { "n", "v" },
    },
    {
      "<Leader>mo",
      "<cmd>Gen Make_Concise<CR>",
      desc = "Make concise",
      mode = { "n", "v" },
    },
    {
      "<Leader>ml",
      "<cmd>Gen Make_List<CR>",
      desc = "Make list",
      mode = { "n", "v" },
    },
    {
      "<Leader>mt",
      "<cmd>Gen Make_Table<CR>",
      desc = "Make table",
      mode = { "n", "v" },
    },
  },
  opts = {
    model = "codestral", -- The default model to use.
    quit_map = "q", -- set keymap to close the response window
    retry_map = "<c-r>", -- set keymap to re-send the current prompt
    accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
    protocol = "https",
    host = "api.mistral.ai", -- The host running the Ollama service.
    port = nil, -- The port on which the Ollama service is listening.
    display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
    show_prompt = false, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
    show_model = false, -- Displays which model you are using at the beginning of your chat session.
    no_auto_close = false, -- Never closes the window automatically.
    file = false, -- Write the payload to a temporary file to keep the command short.
    hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
    init = function() end,
    -- Function to initialize Ollama
    -- function(options)
    --   pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
    --   end,
    command = function(options)
      local api_key = os.getenv("MISTRALAI_API_KEY")
      local body = {model = options.model, stream = true}
      local location = options.protocol .. "://" .. options.host
      if options.port ~= nil then
        location = location .. ":" .. options.port
      end
      return "curl " ..
        "--silent " ..
        "--no-buffer " ..
        "--header 'Authorization: Bearer " .. api_key .. "' " ..
        "--location " .. location .. "/v1/chat/completions " ..
        "--data $body"
        --"--data '" .. body .. "'"
    end,
    list_models = function()
      return {
        "codestral-latest",
        "ministral-3b-latest",
        "ministral-8b-latest",
        "mistral-embed",
        "mistral-moderation-latest",
        "mistral-ocr-latest",
        "mistral-saba-latest",
        "mistral-small-latest",
        "mistral-large-latest",
        "open-codestral-mamba",
        "open-mistral-nemo",
        "pixtral-12b-2409",
        "pixtral-large-latest",
      }
    end,
    -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
    -- This can also be a command string.
    -- The executed command must return a JSON object with { response, context }
    -- (context property is optional).
    -- list_models = '<omitted lua function>', -- Retrieves a list of model names
    result_filetype = "markdown", -- Configure filetype of the result buffer
    debug = false -- Prints errors and the command which is run.
  }
}
