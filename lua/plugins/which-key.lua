return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    border = "rounded", -- none, single, double, shadow
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    plugins = {
      spelling = true,
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "..", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
      padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      zindex = 1000, -- positive value to position WhichKey above other floating windows.
    },
    triggers_nowait = {
      -- marks
      "`",
      "'",
      "g`",
      "g'",
      -- registers
      '"',
      "<c-r>",
      -- spelling
      "z=",
    },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      -- ["gz"] = { name = "+surround" },
      ["<leader>b"] = { name = "Buffers" },
      ["<leader>h"] = { name = "Harpoon" },
      ["<leader>c"] = { name = "Comment" },
      ["<leader>f"] = { name = "File" },
      ["<leader>g"] = { name = "+Git" },
      ["<leader>gh"] = { name = "Hunks" },
      ["<leader>q"] = { name = "+Quit" },
      ["<leader>s"] = { name = "Spelling" },
      ["<leader>sw"] = { name = "surround word" },
      ["<leader>u"] = { name = "UI" },
      ["<leader>w"] = { name = "Windows" },
      ["<leader>v"] = { name = "Nvim" },
      --["<leader>t"] = { name = "TODO" },
      ["<leader>d"] = { name = "Diagnostics/Quickfix" },
      ["dn"] = { name = "diagnostic next" },
      ["dp"] = { name = "diagnostic prev" },
      ["dl"] = { name = "diagnostic line" },
      ["<leader>o"] = { name = "Open" },
      ["<leader>l"] = { name = "LSP" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
