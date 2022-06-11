local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  print('cmp not found : cmp.lua')
end
local lspkind = require('lspkind')
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  print('Luasnip Needed : cmp.lua')
end

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local cmp_icons = {
  Text = "  ",
  Method = " m ",
  Function = "  ",
  Constructor = "  ",
  Field = "  ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = "  ",
  Property = "  ",
  Unit = "  ",
  Value = "  ",
  Enum = "  ",
  Keyword = "  ",
  Snippet = "  ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = "  ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  ",
}

--require("luasnip/loaders/from_vscode").lazy_load()
require'luasnip'.filetype_extend("react-ts", {"html"})
require'luasnip'.filetype_extend("typescript", {"html"})
local M = {}
M.config = {
  cmp.setup {
    enabled = function()
      -- disable completion in comments
      local context = require 'cmp.config.context'
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        -- return not context.in_treesitter_capture("comment")
        return not context.in_syntax_group("Comment")
      end
    end,
    buffer = {enabled = false}, -- prevent in buffer like neotree
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    view = {
      entries = { name = "custom", selection_order = "top_down" }
    },
    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = false},
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    formatting = {
      fields = { "abbr", "kind", "menu" },
      --[[format = function(entry, vim_item)
        -- Kind icons
         vim_item.kind = string.format("%s", cmp_icons[vim_item.kind])
        --vim_item.kind = string.format('%s %s', cmp_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,]]
      format = lspkind.cmp_format({
        mode = "symbol_text",
        symbol_map = cmp_icons,
        maxwidth = 80,
      })
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = { border = { "╭", "─", "╮", " ", "╯", "─", "╰", " " }, scrollbar = "│" },
      documentation = {
        border = { "╭", " ", "╮", "│", "╯", " ", "╰", "│" },
        scrollbar = "│",
      }, },
    experimental = {
      ghost_text = false,
      native_menu = false,
    },
    duplicates = {
      nvim_lsp = 1,
      luasnip = 1,
      cmp_tabnine = 1,
      buffer = 1,
      path = 1,
    },
  }
}
return M


