if !exists('g:test#apex#sfdx#file_pattern')
  let g:test#apex#sfdx#file_pattern = '\v([Tt]est.*|.*[Tt]est(s|Case)?)\.cls$'
endif

function! test#apex#sfdx#test_file(file) abort
    return a:file =~? g:test#apex#sfdx#file_pattern
endfunction

function! test#apex#sfdx#build_position(type, position) abort
  let sf_org = exists('$SF_ORG') ? $SF_ORG : 'dev'
  let filename = fnamemodify(a:position['file'], ':t:r')
  if a:type ==# 'nearest' || a:type ==# 'file'
    return ["force:apex:test:run -o " . sf_org . " -c -r human --synchronous -n " .  filename]
  else
    return ["force:apex:test:run -l RunLocalTests -r human -c -o " . sf_org . " -y"]
  endif
endfunction

function! test#apex#sfdx#build_args(args) abort
  return a:args
endfunction

function! test#apex#sfdx#executable() abort
  return 'sfdx'
endfunction

test#RegisterPositionStrategy('apex', 'nearest', function()
  local file = vim.api.nvim_buf_get_name(0)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1]

  -- Start from the current line and go upwards until we find a test method
  for i = cursor_line, 1, -1 do
    local line = lines[i - 1] -- Lua tables are 1-indexed, but Vim lines are 0-indexed
    if line:match("@isTest") then
      local next_line = lines[i]
      local test_name = next_line:match("test%s*([%w_]+)")
      if test_name then
        return { file = file, test = test_name }
      end
    end
  end

  -- If no test method was found, return the file position strategy instead
  return { file = file }
end)
