function ApplyDiagnosticHighlights()
    vim.cmd("hi VirtualTextErrorSign   ctermbg=12 ctermfg=15 guifg=#ff5454 guibg=#391717 gui=ITALIC")
    vim.cmd("hi VirtualTextWarningSign ctermbg=14 ctermfg=0  guifg=#e3c78a guibg=#342e22 gui=ITALIC")
    vim.cmd("hi VirtualTextInfoSign    ctermbg=11 ctermfg=15 guifg=#74b2ff guibg=#1e2a39 gui=ITALIC")
end

local ns = vim.api.nvim_create_namespace("diag")

function SortDiags()
    local diag_err  = {}
    local diag_warn = {}
    local diag_info = {}
    local diag_hint = {}

    for _, v in pairs(vim.diagnostic.get(0)) do

        if v.severity == vim.diagnostic.severity.ERROR then
            table.insert(diag_err, v)
        end
        if v.severity == vim.diagnostic.severity.WARN then
            table.insert(diag_warn, v)
        end
        if v.severity == vim.diagnostic.severity.INFO then
            table.insert(diag_info, v)
        end
        if v.severity == vim.diagnostic.severity.HINT then
            table.insert(diag_hint, v)
        end
    end
    return {diag_err, diag_warn, diag_info, diag_hint}
end

function CreateDiagVirtText()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
    local diag_cats = SortDiags()

    vim.diagnostic.show(ns, 0, nil)

    for _, v in pairs(diag_cats[1]) do WriteVirtText(v.message, v.lnum, "DiagnosticVirtualTextError"  ) end
    for _, v in pairs(diag_cats[2]) do WriteVirtText(v.message, v.lnum, "DiagnosticVirtualTextWarn") end
    for _, v in pairs(diag_cats[3]) do WriteVirtText(v.message, v.lnum, "DiagnosticVirtualTextInfo"   ) end
    for _, v in pairs(diag_cats[4]) do WriteVirtText(v.message, v.lnum, "DiagnosticVirtualTextHint"   ) end
end

function WriteVirtText(text, lnum, highlight)
        vim.api.nvim_buf_set_extmark(0, ns, lnum, 1, {
            virt_text = { {"▎", highlight}, {text .. " ", highlight} },
            virt_text_pos = "eol",
        })
end

vim.api.nvim_create_autocmd({ "DiagnosticChanged", "InsertLeave" }, { callback = function ()
    vim.cmd("silent! lua CreateDiagVirtText()")
end })
