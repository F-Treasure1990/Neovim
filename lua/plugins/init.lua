return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      "<C-l>",
      "<C-h>",
      "<C-j>",
      "<C-k>",
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        "css",
        "lua",
        "javascript",
        html = { mode = "background" },
      }, { mode = "foreground" })
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      -- symbol = "│",
      symbol = "╎",
      options = {
        try_as_border = true,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "nvim-tree", "Trouble", "lazy", "mason", "telescope" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "rmagatti/goto-preview",
    event = "InsertEnter",
    config = function()
      require("goto-preview").setup({
        width = 70, -- Width of the floating window
        height = 10, -- Height of the floating window
        border = { "↖", "─", " ", " ", " ", "─", " ", " " }, -- Border characters of the floating window
        default_mappings = true,
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
        focus_on_open = true, -- Focus the floating window when opening it.
        dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true, -- Whether to nest floating windows
        preview_window_title = { enable = true, position = "left" }, -- Whether
      })
    end,
  },
  {
    "folke/twilight.nvim",
    keys = { { "<leader>tw", "<cmd>Twilight<CR>", desc = "Twilight" } },
    opts = {
      dimming = {
        alpha = 0.5,
        color = { "Normal", "#ffffff" },
        term_bg = "#1E1D2D", -- if guibg=NONE, this will be used to calculate text color
      },
      -- context = 10, -- amount of lines we will try to show around the current line
      exclude = {}, -- exclude these filetypes
    },
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>ou", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = "MarkdownPreview",
    ft = { "markdown" },
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
