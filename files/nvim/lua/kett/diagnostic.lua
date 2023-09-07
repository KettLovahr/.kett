vim.api.nvim_create_autocmd({ "DiagnosticChanged", "InsertLeave" }, { callback = function ()
    vim.diagnostic.setqflist({open = false})
end })
