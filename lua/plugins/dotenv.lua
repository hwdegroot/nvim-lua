local dotenv = require('dotenv')
local M = {}

function M.setup()
  return dotenv.setup({
    -- will load your .env file upon loading a buffer
    enable_on_load = true,
    -- show error notification if .env file is not found and if .env is loaded
    verbose = false,
  })
end

return M
