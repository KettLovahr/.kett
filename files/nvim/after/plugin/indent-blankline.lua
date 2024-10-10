local highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterOrange',
    'RainbowDelimiterYellow',
    'RainbowDelimiterGreen',
    'RainbowDelimiterCyan',
    'RainbowDelimiterBlue',
    'RainbowDelimiterViolet',
}

require("ibl").setup({
    indent = {
        highlight = "IblIndent",
        char = '▏',
        -- char = '▎',
    },
    scope = {
        highlight = highlight,
        show_start = false,
        show_end = false,
    },
})

local hooks = require("ibl.hooks")
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- It does not look good or work well in vscode-nvim, disable it
if vim.g.vscode then
    vim.cmd("IBLDisable")
end
