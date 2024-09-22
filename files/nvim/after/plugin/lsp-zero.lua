local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')

lsp.preset('recommended')

require('mason-lspconfig').setup({
    ensure_installed = {
    "rust_analyzer",
    "ts_ls",
    "pylsp",
    "lua_ls",
    "zls",
    "clangd",
    "bashls",
    "emmet_ls",
    "cssls",
    "svelte",
    "omnisharp",
    "fsautocomplete",
},
    handlers = {
        lsp.default_setup,
        omnisharp = function ()
            lspconfig.omnisharp.setup({
                  handlers = {
                      ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
                      ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
                      ["textDocument/references"] = require('omnisharp_extended').references_handler,
                      ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
                  },
            })
        end
    },
})

lsp.set_preferences({
    sign_icons = {
        error = "E",
        warn = "W",
        info = "I",
        hint = "H",
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

lspconfig.fsautocomplete.setup {
    single_file_support = true,
}

lsp.setup()
