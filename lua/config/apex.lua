local vim = vim

vim.cmd [[ au BufRead,BufNewFile *.cls,*.trigger,*.apex set filetype=apex ]]
vim.g.ale_linters_explicit = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_fixers = {
    apex = { 'prettier' }
}

vim.cmd [[
augroup set-commentstring-ag
autocmd!
autocmd BufEnter *.cls,*.trigger,*.apex :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
autocmd BufFilePost *.cls,*.trigger,*.apex :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
augroup END
]]

function SFDeployCurrentFile()
    local current_file = vim.fn.expand('%:p')
    local sf_org = os.getenv("SF_ORG") or "dev" -- default to "dev" if SF_ORG is not set
    vim.cmd(':TermExec cmd="sfdx force:source:deploy -p ' .. current_file .. ' -u ' .. sf_org .. '"')
end

function SFDeployAndTestCurrentFile()
    vim.cmd(':lua SFDeployCurrentFile()')
    vim.cmd(':TestFile')
end

function SFExecute(start_line, end_line)
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    local apex_code = table.concat(lines, "\n")

    local temp_file = os.tmpname() .. ".apex"
    local file = io.open(temp_file, "w")
    if file ~= nil then
        file:write(apex_code)
        file:close()
    end

    local sf_org = os.getenv("SF_ORG") or "dev" -- default to "dev" if SF_ORG is not set
    vim.cmd(':TermExec cmd="sfdx force:apex:execute -f ' .. temp_file .. ' -u ' .. sf_org .. '"')

    -- os.remove(temp_file)
end

vim.cmd("command! -range SFExecute :lua SFExecute(<line1>, <line2>)")
vim.cmd("command! -nargs=0 SFDeployCurrentFile :lua SFDeployCurrentFile()")
vim.cmd("command! -nargs=0 SFDeployAndTestCurrentFile :lua SFDeployAndTestCurrentFile()")

vim.api.nvim_set_keymap('v', '<leader>r', ':SFExecute<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':lua SFDeployCurrentFile()<cr>', { noremap = true, silent = true })
