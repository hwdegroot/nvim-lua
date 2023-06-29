local M, ufo, vim, nmap = {}, require("ufo"), vim, require("config.utils").nmap

-- ╭──────────────────────────────────────────────────────────╮
-- │ Custom handler function                                  │
-- ╰──────────────────────────────────────────────────────────╯

function M.setup()
    ufo.setup({
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = ("  %d "):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0

            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end

            table.insert(newVirtText, { suffix, "MoreMsg" })

            return newVirtText
        end,
        close_fold_kinds = { "imports" },
    })
    --nmap('zR', ufo.openAllFolds)
    --nmap('zM', ufo.closeAllFolds)
    --nmap('zr', ufo.openFoldsExceptKinds)
    --nmap('zm', ufo.closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
    --nmap('<C-S-Space>', ufo.openAllFolds)
    --nmap('<C-Space>', ufo.closeAllFolds)
    nmap("<C-S-Space>", ufo.openAllFolds)
    nmap("<C-Space>", ufo.closeAllFolds)
    nmap('<S-Space>', ufo.openFoldsExceptKinds)
    nmap('<Space>', ufo.closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
    nmap('K', function()
        local winid = ufo.peekFoldedLinesUnderCursor()
        if not winid then
            vim.lsp.buf.hover()
        end
    end)
end

return M
