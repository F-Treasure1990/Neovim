return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel", "NvimTree" },
    fast_wrap = {
      map = "<C-f>",
      chars = { "{", "[", "(", '"', "'", "`" },
      --	pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl123456789",
      check_comma = true,
      manual_position = true,
      highlight = "Character",
      highlight_grey = "Comment",
    },
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
  end,
}
