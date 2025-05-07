require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  adapters = { "pwa-node" },
  node_path = os.getenv("NODE_PATH") or "node", -- Path for nodejs, defaults to $NODE_PATH, or "node"
  debugger_cmd = { "js-debug-adapter", "js-debug-server" },
  log_file_path = "/tmp/js-debug-adapter.log", -- Path to the log file
  --console = "integratedTerminal",
	log_file_level = vim.log.levels.ERROR,
	  --log_file_level = false,
	  --log_console_level = false,
	  --log_console_level = vim.log.levels.ERROR,
	  --log_console_level = vim.log.levels.WARN,
	log_console_level = vim.log.levels.WARN,
})

-- https://github.com/mxsdev/nvim-dap-vscode-js?tab=readme-ov-file#configurations
for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
  }
end

require("dap").adapters = {
  coreclr = {
    id = "coreclr",
    type = "executable",
    command = "/usr/local/share/netcoredbg/netcoredbg",
    args = { "--interpreter=vscode" },
  },
  docker = {
    type = "server",
    port = 5001,
  },
}

require("dap").configurations = {
  cs = {
    {
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      cwd = "${workspaceFolder}",
      program = function()
        --if vim.fn.findfile(vim.fn.getcwd() .. '.vscode/launch.json') then
        --  return (vim.fn.getcwd() .. "")
        --end
        return vim.fn.input("Path to dll: ", vim.fn.getcwd(), "file")
      end,
      stopOnEntry = false,
      runInTerminal = false,
      env = {
        ASPNETCORE_ENVIRONMENT = function()
          return vim.fn.input("ASPNETCORE_ENVIRONMENT: ", "Development")
        end,
        ASPNETCORE_URLS = function()
          return vim.fn.input("ASPCORE_URLS: ", "http://+:5000>")
        end,
      },
      console = "integratedTerminal",
    },
  },
  docker = {
    type = "docker",
    request = "attach",
    mode = "remote",
  },
}

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
    indent = 2,
  },
  force_buffers = true,
})
--auto open & close the UI panes
require("dap").listeners.before.attach.dapui_config = function()
  require("dapui").open()
end
require("dap").listeners.before.launch.dapui_config = function()
  require("dapui").open()
end
require("dap").listeners.before.event_terminated.dapui_config = function()
  require("dapui").close()
end
require("dap").listeners.before.event_exited.dapui_config = function()
  require("dapui").close()
end
require("dap").listeners.after.event_initialized["dapui_config"] = function()
  require("dapui").open()
end

-- Use .vscode/launch.json files, if present
require("config.nvim-dap.ext.vscode").load_launchjs()
