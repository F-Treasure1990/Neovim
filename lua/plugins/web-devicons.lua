return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    require("nvim-web-devicons").set_icon({
      gql = {
        icon = "",
        color = "#e535ab",
        cterm_color = "199",
        name = "GraphQL",
      },
      ts = {
        icon = "󰛦",
        color = "#89B4FA",
        name = "TypeScript",
      },
      tsx = {
        icon = "",
        color = "#89B4FA",
        name = "TypeScript",
      },
    })
  end,
}
