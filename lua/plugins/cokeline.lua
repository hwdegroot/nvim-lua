local get_hex = require("cokeline.utils").get_hex
local space = {text = " "}

local M = {}

function M.setup()
    require("cokeline").setup(
    {
        show_if_buffers_are_at_least = 1,
        mappings = {
            cycle_prev_next = true,
        },
        buffers = {
            filter_visible = function(buffer)
                return buffer.type ~= "terminal"
            end
        },
        default_hl = {
            fg = function(buffer)
                if buffer.is_focussed then
                    return '#b4b4b4'
                end
                return "#77929e"
                --return "none"
            end,
            bg = function(buffer)
                if buffer.is_focussed then
                    return '#005f87'
                end
                return 'none'
                --return "none"
            end
        },
        components = {
            space,
            {
                text = "| ",
                hl = {
                    fg = "#77929e",
                    style = "bold"
                }
            },
            space,
            {
                text = function(buffer)
                    return buffer.devicon.icon
                end,
                hl = {
                    fg = function(buffer)
                        return buffer.devicon.color
                    end
                }
            },
            {
                text = function(buffer)
                    return buffer.filename
                end,
                hl = {
                    fg = function(buffer)
                        if buffer.is_focused then
                            return "#ff0000"
                        end
                        if buffer.lsp.errors ~= 0 then
                            return "#c43060"
                        end
                    end,
                    style = function(buffer)
                        local style
                        if buffer.is_focused then
                            style = "bold,italic"
                        end
                        if buffer.lsp.errors ~= 0 then
                            if style then
                                style = style .. ",underline"
                            else
                                style = "underline"
                            end
                        end
                        return style
                    end
                }
            },
            {
                text = function(buffer)
                    if buffer.is_readonly then
                        return " "
                    end
                    return ""
                end
            },
            {
                text = function(buffer)
                    return buffer.is_modified and "  " or " 窱"
                end,
                delete_buffer_on_left_click = true,
                hl = {
                    fg = function(buffer)
                        if buffer.is_modified then
                            return "#7fc06e"
                        end
                        return "#77929e"
                    end
                    --  style = "bold"
                }
            },
            {
                text = function(buffer)
                    local no_of_buffers = #vim.fn.getbufinfo({buflisted = 1})
                    return buffer.index == no_of_buffers and " |" or ""
                end,
                hl = {
                    fg = "#77929e",
                    style = "bold"
                }
            },
            space
        }
    }
    )
end

return M
