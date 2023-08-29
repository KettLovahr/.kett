local lsp = require("lsp-zero")

lsp.preset('recommended')

lsp.ensure_installed = {
    "rust_analyzer",
    "pylsp"
}

lsp.set_preferences({
    sign_icons = {
        error = "E",
        warn = "W",
        info = "I",
        hint = "H",
    }
})

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

--lspconfig.pylsp.setup{
--    settings = {
--        pylsp = {
--            plugins = {
--                pylint = {
--                    enabled = false
--                },
--                flake8 = {
--                    enabled = true
--                }
--            }
--        }
--    }
--}

lspconfig.gdscript.setup {
    cmd       = {"nc", "localhost", "6005"},
    filetypes = {"gdscript"},
    root_dir  = lspconfig.util.root_pattern("project.godot", ".git"),
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

vim.diagnostic.config({
    virtual_text = false, -- I have my own script to display diagnostics the way I want. `lua/kett/diagnostic.lua`
    severity_sort = true,
    update_in_insert = true
})
