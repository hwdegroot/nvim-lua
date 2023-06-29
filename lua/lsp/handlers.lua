local M, vim = {}, vim

M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- protected call to get the cmp
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
    return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

-- apply f to all elements in table
local function foreach(tbl, f)
    local t = {}
    for key, value in ipairs(tbl) do t[key] = f(value) end
    return t
end

-- set qflist and open
local function qf_populate(lines, mode)
    if mode == nil or type(mode) == 'table' then
        lines = foreach(lines, function(item)
            return { filename = item, lnum = 1, col = 1, text = item }
        end)
        mode = "r"
    end

    vim.fn.setqflist(lines, mode)

    vim.cmd [[
        belowright cwindow
        wincmd p
    ]]
end

-- populate qf list with changes (if multiple files modified)
-- NOTE(vir): now using nvim-notify
local function qf_rename()
    local notify = require('notify')
    local position_params = vim.lsp.util.make_position_params()
    position_params.oldName = vim.fn.expand("<cword>")

    vim.ui.input({ prompt = 'Rename To> ', default = position_params.oldName }, function(input)
        if input == nil then
            notify('[lsp] aborted rename', 'warn', { render = 'minimal' })
            return
        end

        position_params.newName = input
        vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, result, ...)
            if not result or not result.changes then
                notify(string.format('could not perform rename'), 'error', {
                    title = string.format('[lsp] rename: %s -> %s', position_params.oldName, position_params.newName),
                    timeout = 500
                })
                return
            end

            vim.lsp.handlers["textDocument/rename"](err, result, ...)

            local notification, entries = '', {}
            local num_files, num_updates = 0, 0
            for uri, edits in pairs(result.changes) do
                num_files = num_files + 1
                local bufnr = vim.uri_to_bufnr(uri)

                for _, edit in ipairs(edits) do
                    local start_line = edit.range.start.line + 1
                    local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

                    num_updates = num_updates + 1
                    table.insert(entries, {
                        bufnr = bufnr,
                        lnum = start_line,
                        col = edit.range.start.character + 1,
                        text = line
                    })
                end

                local short_uri = string.sub(vim.uri_to_fname(uri), #vim.fn.getcwd() + 2)
                notification = notification .. string.format('made %d change(s) in %s', #edits, short_uri)
            end

            notify(notification, 'info', {
                title = string.format('[lsp] rename: %s -> %s', position_params.oldName, position_params.newName),
                timeout = 2500
            })

            if num_files > 1 then qf_populate(entries, "r") end
        end)
    end)
end

vim.lsp.buf.rename = qf_rename

-- Here we let the LSP prioritize null-ls formatters. Why? Normally when we install a separate formatter or linter in null-ls we want to use just them.
-- if you don't prioritize any, neovim will ask you every time you format which one you want to use.
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- this function will attach our previously set keymaps and our lsp_formatting function to every buffer.
M.on_attach = function(client, bufnr)
    require("lsp-inlayhints").on_attach(client, bufnr)
    --lsp_keymaps(bufnr, client)

    if client.supports_method("textDocument/references") then
        vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
    end
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end


-- And finally, here we create a way to toggle format on save with the command "LspToggleAutoFormat" and after everything, we return the M object to use it in other files.
function M.enable_format_on_save()
    vim.cmd [[
    augroup format_on_save
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.format({ async =  true})
    augroup end
    ]]
end

function M.disable_format_on_save()
    M.remove_augroup "format_on_save"
end

function M.toggle_format_on_save()
    if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
        M.enable_format_on_save()
    else
        M.disable_format_on_save()
    end
end

function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
        vim.cmd("au! " .. name)
    end
end

vim.cmd [[ command! LspToggleAutoFormat execute 'lua ]]

-- Toggle "format on save" once, to start with the format on.
M.toggle_format_on_save()

return M
