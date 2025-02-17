-- https://github.com/mfussenegger/nvim-dap/pull/48/files
local dap = require('dap')
local M = {}
local vim = vim

--- Extends dap.configurations with entries read from .vscode/launch.json
--
function M.load_launchjs(path)
  local resolved_path = path or (vim.fn.getcwd() .. '/.vscode/launch.json')
  local file = io.open(resolved_path)
  if not file then
    return
  end
  local contents = file:read("*all")
  file:close()
  local data = vim.fn.json_decode(contents)
  assert(data.configurations, "launch.json must have a 'configurations' key")
  for _, config in ipairs(data.configurations) do
    assert(config.type, "Configuration in launch.json must have a 'type' key")
    local configurations = dap.configurations[config.type]
    if not configurations then
      configurations = {}
      dap.configurations[config.type] = configurations
    end
    --
    -- iterate all the configuration keys and add them to the configuration
    local new_config = {}
    for k, v in pairs(config) do
      if k == 'type' and v == 'docker' then
        new_config['type'] = v
        -- change
        dap.configurations['docker']['port'] = 5001
      end
      if k ~= 'sourceFileMap' then
        new_config['substitutepath'] = {}
        for from, to in pairs(configurations) do
          table.insert(new_config['substitutepath'], {
            from = from,
            to = to
          })
        end
      else
        new_config[k] = v
      end
    end
    table.insert(configurations, new_config)
  end
end

return M
