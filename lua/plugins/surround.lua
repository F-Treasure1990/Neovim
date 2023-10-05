return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "m",
        normal_cur = "ml", -- whole line
        normal_line = "mLL", -- useless
        normal_cur_line = "mn", -- whole line new line
        visual = "m", -- surround new line
        visual_line = "ml", -- all highlight surround new line
        delete = "md",
        change = "mc",
      },
      aliases = {
        ["a"] = ">",
        ["b"] = ")",
        ["c"] = "}",
        ["r"] = "]",
        ["s"] = "'",
        ["d"] = '"',
        ["l"] = "`",
        -- ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
      },
    })
  end,
}
