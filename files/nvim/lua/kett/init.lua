require("kett.remap")
require("kett.packer")
require("kett.diagnostic")

vim.opt.termguicolors = true

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.linebreak = true

vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.updatetime = 100

vim.opt.fillchars= "eob: ,"

vim.opt.guifont = "Victor Mono:h12"

vim.api.nvim_create_autocmd(
    {"BufEnter"}, {
		pattern = {"*.gd"},
		command = "let &l:expandtab = 0"
	}
)

vim.api.nvim_create_autocmd(
    {"TermOpen"}, {
        pattern = {"*"},
        command = "setlocal nonumber"
    }
)
