return {
  "catppuccin/nvim",
  priority = 1000,
  name = "catppuccin",
  opts = {
    flavour = "mocha",
    background = {
      dark = "mocha",
    },
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    -- plugin integrations within catpuccin.
    integrations = {
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      navic = {
        enabled = true,
        custom_bg = "NONE",
      },
      nvimtree = true,
      markdown = true,
      cmp = true,
      gitsigns = true,
      notify = true,
      mini = true,
      harpoon = true,
      mason = true,
      leap = true,
      neotree = true,
      -- nvimtree = true,

      treesitter = true,
      ts_rainbow2 = true,
      lsp_trouble = true,
      which_key = true,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin")
  end,
}
