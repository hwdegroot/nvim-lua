local dap, dapui, dap_vscode = require("dap"), require("dapui"), require("plugins.nvim-dap-vscode")
local vim = vim
local nmap = require('config.utils').nmap

dap.adapters = {
  coreclr = {
    type = 'executable',
    command = '/usr/local/share/netcoredbg/netcoredbg',
    args = { '--interpreter=vscode' }
  },
  docker = {
    type = 'server',
    port = 5001,
  }
}

dap.configurations = {
  cs = {
    {
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
      end,
    }
  },
  docker = {
    type = 'docker',
    request = 'attach',
    mode = 'remote',
  }
}

nmap('<F5>', dap.continue, { silent = false })
nmap('<F6>', dap.step_over, { silent = false })
nmap('<F7>', dap.step_into, { silent = false })
nmap('<F8>', dap.step_out, { silent = false })
nmap('<Leader>b', dap.toggle_breakpoint, { silent = false })
--nmap('<Leader>B', dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')), { silent = false })
--nmap('<Leader>lp', dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')), { silent = false })
nmap('<Leader>dr', dap.repl.open, { silent = false })
nmap('<Leader>dl', dap.run_last, { silent = false })


dapui.setup({
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
    max_height = nil,  -- These can be integers or a float between 0 and 1.
    max_width = nil,   -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Use .vscode/launch.json files, if present
dap_vscode.load_launchjs()
