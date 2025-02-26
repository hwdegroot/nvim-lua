require("cmp").setup({
  sources = {
    { name = 'copilot' },                     -- copilot_cmp
    { name = "git" },                         -- cmp-git
    { name = 'npm',     keyword_length = 4 }, -- cmp-npm
    { name = 'nvim_lsp' },                    -- cmp-nvim-lsp
    { name = 'buffer' },
    { name = 'calc' },
    { name = 'cmp_tabnine' },                 -- cmp-tabnine
    { name = 'codeium' },                     -- codeium
  }
})
