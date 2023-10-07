-- Function for custom component
local function wordcount()
    local end_res = ""
    if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
        end_res = vim.fn.wordcount().words .. " words ~" ..
        math.ceil(vim.fn.wordcount().chars / 1000) .. "mins"
    end
    return tostring(end_res)
end

string.lpad = function(str, len, char)
    if char == nil then char = ' ' end
    return str .. string.rep(char, len - #str)
end

string.rpad = function(str, len, char)
    if char == nil then char = ' ' end
    return string.rep(char, len - #str) .. str
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
  surface0 = '#313244',
  surface1 = '#45475A',
  surface2 = '#585B70',
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
      normal = {
          c = { fg = colors.fg, bg = colors.bg },
          a = { fg = colors.fg, bg = colors.surface1 },
          b = { fg = colors.fg, bg = colors.surface0 },
      },
      inactive = {
          c = { fg = colors.fg, bg = colors.inact_bg },
          a = { fg = colors.surface2, bg = colors.surface1 },
          b = { fg = colors.surface1, bg = colors.surface0 },
      },

      insert = {
          a = { fg = colors.bg, bg = colors.blue }
      },
      visual = {
          a = { fg = colors.bg, bg = colors.cyan }
      },
      replace = {
          a = { fg = colors.bg, bg = colors.red }
      },
      terminal = {
          a = { fg = colors.bg, bg = colors.magenta }
      },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = { 'mode' },
    lualine_b = {
        {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta },
        },
        {
            'branch',
            icon = 'git',
            color = { fg = colors.violet },
        }
    },
    lualine_c = {
        {
            'diff',
            symbols = { added = '+ ', modified = '~ ', removed = '- ' },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        },

        {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = 'E ', warn = 'W ', info = 'I ', hint = 'H ' },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.cyan },
                color_hint = { fg = colors.cyan },
            },
        },

        {
            function()
                return '%='
            end,
        }

    },

    lualine_x = {},
    lualine_y = {
        { 'location' },

        {
            '%P',
            cond = conditions.buffer_not_empty,
        },

        {
            'filesize',
            cond = conditions.buffer_not_empty,
        },

        {
            wordcount,
            cond = conditions.buffer_not_empty,
            color = { fg = colors.blue },
        },
    },
    lualine_z = {
        {
            'o:encoding', -- option component same as &encoding in viml
            fmt = string.upper, -- I'm not sure why it's upper case either ;)
            cond = conditions.hide_in_width,
        },

        {
            'fileformat',
            fmt = string.upper,
            icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
        },
    },
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = { },
    lualine_b = {
        {
            'filename',
            color = {fg = colors.surface2},
            cond = conditions.buffer_not_empty
        },
        {
            'branch',
            icon = 'git'
        },
    },
    lualine_c = {
        {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = 'E ', warn = 'W ', info = 'I ', hint = 'H ' },
            diagnostics_color = {
                error = { fg = colors.surface2 },
                warn = { fg = colors.surface1 },
                info = { fg = colors.surface0 },
                hint = { fg = colors.surface0 },
            },
        },
    },

    lualine_x = {},
    lualine_y = {
        {
            'filesize',
            cond = conditions.buffer_not_empty,
        },
    },
    lualine_z = {
        {
            'o:encoding',
            fmt = string.upper,
            cond = conditions.hide_in_width,
        },

        {
            'fileformat',
            fmt = string.upper,
            icons_enabled = false,
        },
    },
  },
  tabline = {
      lualine_a = { },
      lualine_b = {
          {
              "tabs",
              max_length = vim.o.columns / 1.2,
              mode = 1,
              padding = {
                  left = 0,
                  right = 1
              },
              tabs_color = {
                  active = {fg = colors.fg, bg = colors.surface2 },
                  inactive = {fg = colors.surface1, bg = colors.surface0}
              },
              fmt = function (name, context)
                  local buflist = vim.fn.tabpagebuflist(context.tabnr)
                  local winnr = vim.fn.tabpagewinnr(context.tabnr)
                  local bufnr = buflist[winnr]
                  local mod = vim.fn.getbufvar(bufnr, '&mod')
                  local prefix = " "
                  if context.tabnr == vim.fn.tabpagenr() then
                      prefix = "▍"
                  end

                  return prefix .. string.lpad(name, 12, ' ') .. (mod == 1 and '●' or ' ')
              end
          },
      },
      lualine_x = {
              function ()
                  return os.date("%Y-%m-%d")
              end
      },
      lualine_y = {
          {
              function ()
                  return os.date("%H:%M:%S")
              end
          }
      }
  },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
