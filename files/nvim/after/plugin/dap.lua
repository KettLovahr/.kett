require("mason-nvim-dap").setup({
    ensure_installed = {
        "coreclr",
        "cpptools",
    },
    handlers = {
        function (config)
            require('mason-nvim-dap').default_setup(config)
        end,
    }
})

require("dapui").setup({
    layouts = {
        {
            elements = {
                {id = "stacks", size = 0.4},
                {id = "scopes", size = 0.4},
                {id = "breakpoints", size = 0.2},
            },
            position = "left",
            size = 30
        },
        {
            elements = {
                {id = "repl", size = 0.4},
                {id = "console", size = 0.6},
            },
            position = "bottom",
            size = 10
        }
    }
})

local dap = require('dap')
local dap_ui = require('dapui')

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F6>", dap.pause)

vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>dr", dap.repl.open)
vim.keymap.set("n", "<Leader>dt", dap_ui.toggle)
vim.keymap.set("n", "<Leader>ds", function ()
    dap_ui.float_element("scopes")
end)
vim.keymap.set("n", "<Leader>dh", function ()
    dap_ui.float_element("hover")
end)

vim.keymap.set("n", "<F9>", dap.step_over)
vim.keymap.set("n", "<F10>", dap.step_into)
vim.keymap.set("n", "<F11>", dap.step_out)
vim.keymap.set("n", "<F12>", dap.step_back)
