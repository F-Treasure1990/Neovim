return {
  {
    "ggandor/leap.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end

      leap.add_default_mappings(true)
      --vim.keymap.del({ "x", "o" }, "x")
      --vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "ggandor/flit.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "ggandor/leap.nvim",
    opts = {
      keys = { f = "f", F = "F", t = "t", T = "T" },
      -- A string like "nv", "nvo", "o", etc.
      labeled_modes = "nx",
      multiline = true,
      -- Like `leap`s similar argument (call-specific overrides).
      -- E.g.: opts = { equivalence_classes = {} }
    },
  },
}
