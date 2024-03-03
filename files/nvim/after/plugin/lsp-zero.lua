local lsp = require("lsp-zero")

lsp.preset('recommended')

require('mason-lspconfig').setup({
    ensure_installed = {
    "rust_analyzer",
    "pylsp",
    "lua_ls",
    "zls",
    "clangd",
    "bashls",
    "emmet_ls",
    "cssls",
    "svelte",
    "omnisharp",
},
    handlers = {
        lsp.default_setup,
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

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            }
        },
    }
}

lspconfig.gdscript.setup {
    cmd       = {"nc", "localhost", "6005"},
    filetypes = {"gdscript"},
    root_dir  = lspconfig.util.root_pattern("project.godot", ".git"),
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
        prefix = "▍",
        suffix = " ",
    },
    severity_sort = true,
    update_in_insert = true
})
