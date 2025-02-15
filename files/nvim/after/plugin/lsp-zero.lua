local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')

lsp.set_preferences({
    sign_icons = {
        sign_text = {
            error = "E",
            warn = "W",
            info = "I",
            hint = "H",
        }
    }
})



lspconfig.lua_ls.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            }
        },
    }
}

local on_attach = function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})

    vim.diagnostic.config({
        virtual_text = {
            source = "if_many",
            prefix = "▍",
            suffix = " ",
        },
        severity_sort = true,
        update_in_insert = true
    })
end

lsp.on_attach(on_attach)

lspconfig.gdscript.setup {
    cmd       = {"nc", "localhost", "6005"},
    filetypes = {"gdscript"},
    root_dir  = lspconfig.util.root_pattern("project.godot", ".git"),
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
}

lspconfig.omnisharp.setup {
    single_file_support = true,
}

lspconfig.fsautocomplete.setup {
    single_file_support = true,
}

lspconfig.rust_analyzer.setup {
    single_file_support = true,
}

lsp.setup()
