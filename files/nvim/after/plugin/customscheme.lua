local hi = require("colorscheme").highlight
local colors = require('base16-colorscheme').colors

vim.cmd("colorscheme base16-atelier-cave")

hi.DiagnosticWarn = {ctermfg = 3, guifg = colors.base0A}
