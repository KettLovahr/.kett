vim.g.mapleader = " "

-- Normal Mode Keymaps
vim.keymap.set("n", "<Leader>xx", vim.cmd.Ex)
vim.keymap.set("n", "<Leader>xs", vim.cmd.Sex)
vim.keymap.set("n", "<C-l>", vim.cmd.tabnext)
vim.keymap.set("n", "<C-h>", vim.cmd.tabprev)
vim.keymap.set("n", "<Leader>qf", vim.cmd.copen)

vim.keymap.set("n", "<Leader>cd", ":cd %:p:h<CR>:pwd<CR>")
vim.keymap.set("n", "<Leader>cc", '"+yy') -- Copy current line to system clipboard

-- Visual Mode Keymaps
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv") -- Move selected lines down
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv") -- Move selected lines up

vim.keymap.set("x", "<Leader>c", '"+y') -- Copy selected text to system clipboard

-- The default mapping for exiting Terminal mode kind of sucks
-- Setting it to be Control-Backslash twice
vim.keymap.set("t", "<C-\\><C-\\>", "<C-\\><C-n>")
