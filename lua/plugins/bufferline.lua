return {
  "akinsho/bufferline.nvim",
  after = "catppuccin",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "ojroques/nvim-bufdel",
  },
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<S-l>",      "<cmd> BufferLineCycleNext <CR>",   desc = "next buffer" },
    { "<S-h>",      "<cmd> BufferLineCyclePrev <CR>",   desc = "prev buffer" },
    { "<leader>bo", "<cmd> BufferLineCloseOthers <CR>", desc = "Close others" },
    { "<leader>bp", "<cmd> BufferLinePick <CR>",        desc = "pick buffer open" },
    { "<leader>bc", "<cmd> BufferLinePickClose <CR>",   desc = "pick buffer close" },
    { "<leader>bh", "<cmd> BufferLineCloseLeft <CR>",   desc = "close buffer left" },
    { "<leader>bl", "<cmd> BufferLineCloseRight <CR>",  desc = "close buffer right" },
    { "<leader>fc", "<cmd> BufDel! <CR>",               desc = "close file" },
  },
  opts = {
    options = {
      mode = "buffers",
      separator_style = "slant", -- | "slope" | "thick" | "thin" | { 'any', 'any' },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      truncate_names = true,  -- whether or not tab names should be truncated
      tab_size = 18,
      diagnostics = false,    -- | "nvim_lsp" | "coc",
    },
  }
}
