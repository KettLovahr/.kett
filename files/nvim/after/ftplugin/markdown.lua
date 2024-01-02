vim.opt.spell = true

vim.opt.autoread = true
vim.opt.autowriteall = true

vim.keymap.set("x", "<C-l>", '<Esc>`>a]<Esc>`<i[<Esc>f]a()<Esc>h"+pll')

vim.keymap.set("x", "*", "<Esc>`>a*<Esc>`<i*<Esc>gvll")
vim.keymap.set("x", "_", "<Esc>`>a_<Esc>`<i_<Esc>gvll")
vim.keymap.set("x", "`", "<Esc>`>a`<Esc>`<i`<Esc>gvll")
