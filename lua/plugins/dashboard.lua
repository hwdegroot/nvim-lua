local M = {}

function M.setup()
    require('dashboard').setup({
        -- theme = 'hyper' --  theme is doom and hyper default is hyper
        -- disable_move = false,    --  default is false disable move keymap for hyper
        -- shortcut_type = 'number',  --  shorcut type 'letter' or 'number'
        change_to_vcs_root = true -- default is false,for open file in hyper mru. it will change to the root of vcs
        -- config = {},    --  config used for theme
        -- hide = {
        --     statusline = true,   -- hide statusline default is true
        --     tabline = true,      -- hide the tabline
        --     winbar = true        -- hide winbar
        -- },
        --preview = {
        --    command       -- preview command
        --    file_path     -- preview file path
        --    file_height   -- preview file height
        --    file_width    -- preview file width
        --},
    })
end

return M
