local vim = vim
local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
local icons = require('config.icons')
gl.short_line_list = { 'NvimTree', 'vista', 'dbui', 'packer' }

gls.left[1] = {
    RainbowRed = {
        provider = function() return '▊ ' end,
        highlight = { colors.blue, colors.bg }
    },
}
gls.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode

            local mode_color = {
                n = colors.red,
                i = colors.green,
                v = colors.blue,
                [''] = colors.blue,
                V = colors.blue,
                c = colors.magenta,
                no = colors.red,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.red,
                t = colors.red
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            return '  '
        end,
        highlight = { colors.red, colors.bg, 'bold' },
    },
}
gls.left[3] = {
    FileSize = {
        provider = 'FileSize',
        condition = condition.buffer_not_empty,
        highlight = { colors.fg, colors.bg }
    }
}
gls.left[4] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg },
    },
}

gls.left[5] = {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = { colors.magenta, colors.bg, 'bold' }
    }
}
gls.left[6] = {
    Copilot = {
        provider = function() return ' ' end,
        condition = function()
            if condition.hide_in_width and vim.g.copilot_enabled == 1 then
                return true
            end
            return false
        end,
        icon = icons.copilot,
        highlight = { colors.fg, colors.bg }
    }
}

gls.left[7] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.fg, colors.bg },
    },
}

gls.left[8] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.fg, colors.bg, 'bold' },
    }
}

gls.left[9] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = icons.diagnostics.error,
        --icon = '  ',
        highlight = { colors.red, colors.bg }
    }
}
gls.left[10] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = icons.diagnostics.warn .. ' ',
        --icon = '  ',
        highlight = { colors.yellow, colors.bg },
    }
}

gls.left[11] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = icons.diagnostics.hint .. ' ',
        --icon = '  ',
        highlight = { colors.cyan, colors.bg },
    }
}

gls.left[12] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = icons.diagnostics.info .. ' ',
        condition = function()
            return true
        end,
        highlight = { colors.blue, colors.bg },
    }
}

--gls.left[13] = {
--    SpellBad = {
--        provider = 'SpellBad',
--        icon = icons.spell .. ' ',
--        highlight = { colors.blue, colors.bg },
--    }
--}

gls.right[1] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = { ['dashboard'] = true, [''] = true }
            if tbl[vim.bo.filetype] then
                return false
            end
            return true
        end,
        icon = ' LSP:',
        highlight = { colors.cyan, colors.bg, 'bold' }
    }
}

gls.right[2] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.green, colors.bg, 'bold' }
    }
}

gls.right[3] = {
    FileFormat = {
        provider = 'FileFormat',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.green, colors.bg, 'bold' }
    }
}

gls.right[4] = {
    GitIcon = {
        provider = function() return '  ' end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.violet, colors.bg, 'bold' },
    }
}

gls.right[5] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = { colors.violet, colors.bg, 'bold' },
    }
}
gls.right[6] = {
    Space = {
        provider = function() return ' ' end,
    }
}

gls.right[7] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = { colors.green, colors.bg },
    }
}
gls.right[8] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = { colors.orange, colors.bg },
    }
}
gls.right[9] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = { colors.red, colors.bg },
    }
}

gls.right[11] = {
    RainbowBlue = {
        provider = function() return ' ▊' end,
        highlight = { colors.blue, colors.bg }
    },
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.blue, colors.bg, 'bold' }
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        highlight = { colors.fg, colors.bg, 'bold' }
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = 'BufferIcon',
        highlight = { colors.fg, colors.bg }
    }
}
