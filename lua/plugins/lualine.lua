return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPre" },
  requires = { "nvim-tree/nvim-web-devicons", opt = true },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "filetype", "diagnostics" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
