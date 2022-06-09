local c = require("colors.palette")
local M = {}
 local colors = {
      n = c.blue,
      i = c.green,
      v = c.red,
      [''] = c.blue,
      V = c.blue,
      c = c.purple,
      no = c.red,
      s = c.orange,
      S = c.orange,
      [''] = c.orange,
      ic = c.yellow,
      R = c.purple_alt,
      Rv = c.purple_alt,
      cv = c.red,
      ce = c.red,
      r = c.cyan,
      rm = c.cyan,
      ['r?'] = c.cyan,
      ['!'] = c.red,
      t = c.red,
    }

local theme = {
normal = {
                a = {}, 
                b = {bg = c.black},
                c = { bg = c.bg}, -- does whole main background weirdly
            },
            --[[visual = {
                a = { fg = c.grey_alt, bg = c.purple, gui = "bold" },
                b = { fg = c.gray, bg = c.purple},
                c = { fg = c.gray, bg = c.purple},
            },
            replace = {
                a = { fg = c.grey_alt, bg = c.red, gui = "bold" },
                b = { fg = c.gray, bg = c.red},
                c = { fg = c.gray, bg = c.red},
            },
            normal = {
                a = { fg = c.gray_alt, bg = c.orange, gui = "bold" },
                b = { fg = c.gray, bg = c.orange},
                c = { fg = c.gray, bg = c.orange},
            },
            insert = {
                a = { fg = c.darkgray, bg = c.green, gui = "bold" },
                b = { fg = c.gray, bg = c.green},
                c = { fg = c.gray, bg = c.green},
            },
            command = {
                a = { fg = c.gray_alt, bg = c.orange, gui = "bold" },
                b = { fg = c.gray, bg = c.orange},
                c = { fg = c.gray, bg = c.orange},
            },]]
}

function M.config()
  local status_ok, lualine= pcall(require, "lualine")
  if status_ok then
lualine.setup({
   options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {"neo-tree"},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
  lualine_a = {
    {
      'mode',
      icons_enabled = true, 
      icon = nil,
      separator = {right = ''},     
      cond = nil,
     color = function(section)
            return { bg = colors[vim.fn.mode()], fg =c.black}
         end,
      type = nil,
      padding = 1, 
    }
  },
  lualine_b ={
  {
      'branch',
      icons_enabled = true, 
      icon = '',
      separator = {left = ''},     
      cond = nil,
      color = { bg = c.black, fg =c.green},
      type = nil,
      padding = 2, 
    },
{
      'filetype',
      cond = nil,
      colored = true,
      icon_only = true,
      type = nil,

    }

  },
  lualine_c ={
    {
    "filename",
    path =0,
    shortening_target = 40,
    symbols ={
      modified = ' ',      -- Text to show when the file is modified.
        readonly = ' ',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = ' [  ]',
    },
    color = function(section)
       return { fg = colors[vim.fn.mode()] }
      end,

    }
  },

  lualine_x ={"diagnostics"},

  lualine_y ={


{
      'diff',
      colored = true, -- Displays a colored diff status if set to true
      padding = 2, 
      diff_color = {
        -- Same color values as the general color option can be used here.
    added = { fg = c.green},
    modified = { fg = c.orange },
    removed = { fg = c.red },
      },
      symbols = {added = ' ', modified = '  ', removed = '  '}, -- Changes the symbols used by the diff.
      source = nil, -- A function that works as a data source for diff.
                    -- It must return a table as such:
                    --   { added = add_count, modified = modified_count, removed = removed_count }
                    -- or nil on failure. count <= 0 won't be displayed.
    },
    {
"filesize", 
color = {fg=c.white},
    },
    {
"fileformat",
    color = function(section)
      return { bg = colors[vim.fn.mode()], fg =c.black}
    end,
      separator = {left= ''},     
    }
  },
  lualine_z={
    {"os.date('%d %b %y')", 
    color = function(section)
      return { bg = colors[vim.fn.mode()], fg =c.black}
    end,
    }
  },
},
  tabline = {},
  extensions = {}

})
end 
end

return M
