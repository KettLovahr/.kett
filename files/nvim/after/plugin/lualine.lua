-- Function for custom component
local function wordcount()
    local end_res = ""
    if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
        end_res = vim.fn.wordcount().words .. " words ~" ..
        math.ceil(vim.fn.wordcount().chars / 1000) .. "mins"
    end
    return tostring(end_res)
end


-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#181825',
  inact_bg = '#11111B',
  fg       = '#CDD6F4',
  yellow   = '#F9E2AF',
  cyan     = '#94E2D5',
  darkblue = '#89B4FA',
  green    = '#A6E3A1',
  orange   = '#FAB387',
  violet   = '#B4BEFE',
  magenta  = '#CBA6F7',
  blue     = '#89B4FA',
  red      = '#F38BA8',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.inact_bg } },

      insert = { a = { fg = colors.bg, bg = colors.blue } },
      visual = { a = { fg = colors.bg, bg = colors.cyan } },
      replace = { a = { fg = colors.bg, bg = colors.red } },
      terminal = { a = { fg = colors.bg, bg = colors.magenta } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
  table.insert(config.inactive_sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
  table.insert(config.inactive_sections.lualine_x, component)
end


ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
}


ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = 'E ', warn = 'W ', info = 'I ', hint = 'H ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
    color_hint = { fg = colors.cyan },
  },
}

ins_left {
  'branch',
  icon = 'git',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_left {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = '+ ', modified = '~ ', removed = '- ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

-- Add components to right sections

ins_right { 'location' }

ins_right {
    '%P',
    cond = conditions.buffer_not_empty,
}

ins_right {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_right {
    wordcount,
    cond = conditions.buffer_not_empty,
    color = { fg = colors.blue },
}

ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
