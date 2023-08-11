local highlight = vim.api.nvim_set_hl
local global = 0
--vim.cmd [[
--hi NoneText ctermfg=238 ctermbg=NONE guifg=#000000 guibg=NONE
--hi SpecialKey ctermfg=130 ctermbg=NONE guifg=#af5f00 guibg=NONE
--]]
highlight(global, "SpellBad", {
    underline = true,
    undercurl = false,
    fg = "Blue",
    ctermfg = "Blue",
})
--highlight(global, "NoneText", { ctermfg = 238, fg = "Black" })
--highlight(global, "SpecialKey", { ctermfg = 130, fg = "#af5f00" })
