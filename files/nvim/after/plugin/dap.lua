require("mason-nvim-dap").setup({
    handlers = {
        function (config)
            require('mason-nvim-dap').default_setup(config)
        end,
    }
})

local dap = require('dap')

vim.keymap.set("n", "<F5>", dap.continue)

vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>dr", dap.repl.open)
vim.keymap.set("n", "<Leader>dp", dap.pause)

vim.keymap.set("n", "<F9>", dap.step_over)
vim.keymap.set("n", "<F10>", dap.step_into)
vim.keymap.set("n", "<F11>", dap.step_out)
vim.keymap.set("n", "<F12>", dap.step_back)
