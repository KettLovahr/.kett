require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "python", "javascript" },

  sync_install = false,

  auto_install = true,

  ignore_install = { }, -- Zig parser makes Neovim hang entirely.

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
  rainbow = {
      enable = true,
      extended_mode = false,
      max_file_lines = nil,
      colors = {
          "#ED8796",
          "#F5A97F",
          "#EED49F",
          "#A6DA95",
          "#7DC4E4",
          "#C6A0F6",
      }
  }
}

vim.g.rainbow_delimiters = {
    blacklist = { "zig" },
    query = {
        lua = "rainbow-blocks",
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterOrange',
        'RainbowDelimiterYellow',
        'RainbowDelimiterGreen',
        'RainbowDelimiterCyan',
        'RainbowDelimiterBlue',
        'RainbowDelimiterViolet',
    }
}
