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

    vim.g.neovide_hide_mouse_when_typing = true

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

    vim.api.nvim_create_user_command("KettNormal", function()
        vim.opt.guifont = "Iosevka Extended:h12"
        vim.cmd.colorscheme("catppuccin-mocha")
        vim.opt.laststatus = 2
    end, {
        desc = "Change the font and theme inside of Neovide to my usual schtick",
    })
    vim.api.nvim_create_user_command("KettRetro", function()
        vim.opt.guifont = "MxPlus Amstrad PC:h18:#e-alias"
        vim.cmd.colorscheme("zaibatsu")
        vim.opt.laststatus = 0
    end, {
        desc = "Change the font and theme inside of Neovide so I can go So Retro",
    })
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

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'single'
    opts.max_width= opts.max_width or 80
    opts.max_height= opts.max_height or 24
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
