local M, cmpnpm = {}, require('cmp-npm')

M.setup = function()
    cmpnpm.setup({
        ignore = {},
        only_semantic_versions = true,
    })
end

return M

