-- Vim lsp show diagnostics on hover, instead of in-line
-- THe diagnostics part is in the lsp.setup
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = false,
--         underline = true,
--         signs = true,
--     }
-- )
--vim.cmd[[
--autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
--autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
--]]


-- enable preview of lsp diagnostics
local M = {}

function M.setup()
    vim.opt.updatetime = 250
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, border='rounded'})]]
end

return M
