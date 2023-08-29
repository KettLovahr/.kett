local builtin = require("telescope.builtin")

vim.keymap.set("n", '<Leader>ff', builtin.find_files)
vim.keymap.set("n", '<Leader>bf', builtin.buffers)
vim.keymap.set("n", '<C-p>', builtin.git_files)
vim.keymap.set("n", '<Leader>gg', builtin.live_grep)
vim.keymap.set("n", '<Leader>ss', builtin.lsp_dynamic_workspace_symbols)
