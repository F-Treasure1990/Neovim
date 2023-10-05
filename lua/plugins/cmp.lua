return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path",   -- source for file system paths
    "L3MON4D3/LuaSnip",   -- snippet engine
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  },
  opts = function()
    local luasnip = require("luasnip")
    local cmp = require("cmp")
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

    return {
      completion = {
        completeopt = "menu,menuone,noselect,preview",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = {
          side_padding = 1,
          winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
          scrollbar = false,
          completeopt = "noselect",
          border = border("CmpPmenu"),
        },
        documentation = {
          border = border("CmpPmenu"),
          side_padding = 2,
          winhighlight = "Normal:CmpPmenu,CursorLine:CursorLine,Search:None",
          maxwidth = 60, -- Set the maximum width of the documentation window
          scrollbar = false
        },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-h>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ cmp.ConfirmBehavior.Replace, select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          local col = vim.fn.col(".") - 1
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
            fallback()
          else
            cmp.complete()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" },  -- text within current buffer
        { name = "nvim_lua", max_item_count = 5, keyword_length = 2 },
        { name = "path" },    -- file system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        expandable_indicator = true,
        fields = { "abbr", "kind", "menu" },
        format = function(_, item)
          local icons = require("utils.icons").kinds
          local ELLIPSIS_CHAR = "…"
          local MAX_LABEL_WIDTH = 24
          local MIN_LABEL_WIDTH = 24
          local label = item.abbr
          local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)

          item.kind = string.format("%s %s", " " .. icons[item.kind] .. " ", item.kind .. " ")
          if truncated_label ~= label then
            item.abbr = truncated_label .. ELLIPSIS_CHAR
          elseif string.len(label) < MIN_LABEL_WIDTH then
            local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
            item.abbr = label .. padding
          end

          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "LspCodeLens",
        },
      },
    }
  end,
  config = function(_, opts)
    local cmp = require("cmp")

    require("luasnip.loaders.from_vscode").lazy_load()

    require("luasnip.loaders.from_vscode").lazy_load({
      paths = "~/.config/nvim/lua/utils/snippets",
    })

    -- global cmp options
    cmp.setup(opts)

    -- auto close brackets
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local handlers = require("nvim-autopairs.completion.handlers")

    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done({
        filetypes = {
          -- "*" is a alias to all filetypes
          ["*"] = {
            ["("] = {
              kind = {
                cmp.lsp.CompletionItemKind.Function,
                cmp.lsp.CompletionItemKind.Method,
              },
              handler = handlers["*"],
            },
          },
          -- Disable for tex
          tex = false,
        },
      })
    )
    -- highlights
    local c = require("utils.colors")

    require("utils.functions").HLS({
      -- standard text in cmpmenu
      CmpItemAbbr = { fg = c.white },
      -- search word found
      CmpItemAbbrMatch = { fg = c.cyan, bold = true },
      -- menu background
      CmpPmenu = { bg = c.darker_black, fg = c.white, blend = 0 },
      -- cmp selection
      PmenuSel = { fg = c.darker_black, bg = c.vibrant_green, bold = true },
    })
  end,
}
