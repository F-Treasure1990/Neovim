local function border(hl_name)
  return {
    { " ", hl_name },
    { " ", hl_name },
    { " ", hl_name },
    { " ", hl_name },
    { " ", hl_name },
    { " ", hl_name },
    { " ", hl_name },
    { " ", hl_name },
  }
end
local diagnostic_table = {
  { type = "DiagnosticSignError", sign = "" },
  { type = "DiagnosticSignWarn", sign = "" },
  { type = "DiagnosticSignHint", sign = "" },
  { type = "DiagnosticSignInfo", sign = "" },
}

local float_window = {
  header = {
    "Diagnostics:",
    "DiagnosticsFLoatTitle",
  },
  severity_sort = true,
  suffix = " ",
  prefix = " ",
  source = "if_many",
  border = border("CmpPmenu"),
  format = function(d)
    local code = d.code or (d.user_data and d.user_data.lsp.code)
    if code then
      return string.format(" %s [%s]", d.message, code):gsub("1. ", "")
    end
    return d.message
  end,
}

local virtual_text = {
  prefix = "",
  spacing = 0,
  source = false,
  underline = true,

  --[[ format = function(diagnostic)
    if diagnostic.severity == vim.diagnostic.severity.INFO then
      return string.format(" %s", diagnostic.message)
    end
    if diagnostic.severity == vim.diagnostic.severity.HINT then
      return string.format(" %s", diagnostic.message)
    end
    if diagnostic.severity == vim.diagnostic.severity.WARN then
      return string.format("  %s", diagnostic.message)
    end
    if diagnostic.severity == vim.diagnostic.severity.ERROR then
      return string.format("  %s", diagnostic.message)
    end
  end, ]]
  format = function()
    return ""
  end,
}

vim.diagnostic.config({
  update_in_insert = true,
  enabled = true,
  undercurl = true,
  float = float_window,
  severity_sort = true,
  virtual_text = virtual_text,
  --underline = true,
  signs = false,
})

local c = require("utils.colors")

require("utils.functions").HLS({
  LspInlayHint = {
    fg = c.nord_blue,
    bold = true,
    italic = true,
    undercurl = true,
  },
  DiagnosticVirtualTextError = {
    fg = c.red,
    bg = "NONE",
  },
  DiagnosticVirtualTextHint = {
    fg = c.green,
    bg = "NONE",
  },
  DiagnosticVirtualTextWarn = {
    fg = c.sun,
    bg = "NONE",
  },

  DiagnosticUnderlineWarn = {
    fg = c.sun,
    bg = "NONE",
    undercurl = true,
  },
  DiagnosticUnderlineInfo = {
    fg = c.green,
    bg = "NONE",
    undercurl = true,
  },
  DiagnosticUnderlineError = {
    fg = c.red,
    bg = "NONE",
    undercurl = true,
  },
  DiagnosticUnnecessary = {
    undercurl = true,
  },
})
