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


-- Insert Mode Keymaps
vim.keymap.set("i", "{<CR>", "{<CR>}<C-c>O")
vim.keymap.set("i", "[<CR>", "[<CR>]<C-c>O")
vim.keymap.set("i", "(<CR>", "(<CR>)<C-c>O")

-- Enclose visual selection
-- I have been using it a lot more often so, might as well make it easier for
-- myself.
--
-- I came up with this I'm sure there's a better approach but it *works* and 
-- I'm proud of it <3
vim.keymap.set("x", "(", "<Esc>`>a)<Esc>`<i(<Esc>gvll")
vim.keymap.set("x", "[", "<Esc>`>a]<Esc>`<i[<Esc>gvll")
vim.keymap.set("x", "{", "<Esc>`>a}<Esc>`<i{<Esc>gvll")
vim.keymap.set("x", "'", "<Esc>`>a'<Esc>`<i'<Esc>gvll")
vim.keymap.set("x", '"', '<Esc>`>a"<Esc>`<i"<Esc>gvll')
vim.keymap.set("x", "<", "<Esc>`>a><Esc>`<i<<Esc>gvll")

vim.keymap.set("x", "*", "<Esc>`>a*<Esc>`<i*<Esc>gvll")
vim.keymap.set("x", "_", "<Esc>`>a_<Esc>`<i_<Esc>gvll")
vim.keymap.set("x", "`", "<Esc>`>a`<Esc>`<i`<Esc>gvll")

vim.keymap.set("x", "<C-l>", '<Esc>`>a]<Esc>`<i[<Esc>f]a()<Esc>h"+pll')
