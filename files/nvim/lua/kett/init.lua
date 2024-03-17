require("kett.remap")
require("kett.packer")
require("kett.diagnostic")

vim.opt.termguicolors = true
vim.opt.cursorline = true

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

if vim.g.neovide then
    vim.opt.guifont = "Iosevka Extended:h12"

    local toggle_fullscreen =  function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end

    vim.keymap.set({'n', 'i', 'v'}, "<F11>", toggle_fullscreen)
    vim.keymap.set({'n', 'i', 'v'}, "<C-Tab>", vim.cmd.tabnext)
    vim.keymap.set({'n', 'i', 'v'}, "<C-S-Tab>", vim.cmd.tabprev)

    vim.keymap.set({'n', 'i', 'v'}, "<C-=>", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.25
        print(tostring(vim.g.neovide_scale_factor)) -- Printing because otherwise the scale does not immediately take effect
    end)
    vim.keymap.set({'n', 'i', 'v'}, "<C-->", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1/1.25
        print(tostring(vim.g.neovide_scale_factor))
    end)
end

vim.api.nvim_create_autocmd(
    {"BufEnter"}, {
		pattern = {"*.gd"},
		command = "let &l:expandtab = 0"
	}
)

vim.api.nvim_create_autocmd(
    {"BufEnter"}, {
        pattern = {"*.qml"},
        command = "set filetype=qml"
    }
)

vim.api.nvim_create_autocmd(
    {"TermOpen"}, {
        pattern = {"*"},
        command = "setlocal nonumber"
    }
)
