vim.cmd("colorscheme base16-ayu-dark")

local hi = require("colorscheme").highlight
local colors = require('base16-colorscheme').colors

hi.DiagnosticWarn = {ctermfg = 3, guifg = colors.base0A}
hi.DiagnosticUnderlineWarn = {cterm = 'underline', gui = 'undercurl', guisp = colors.base0A}
