return {
  "ThePrimeagen/harpoon",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local keymap = vim.keymap.set

    keymap("n", "<leader>ha", mark.add_file, { desc = "added to harpoon" })
    keymap("n", ",", ui.toggle_quick_menu, { desc = "harpoon open" })
    keymap("n", "<leader>hh", function()
      ui.nav_file(1)
    end, { desc = "file 1" })
    keymap("n", "<leader>hj", function()
      ui.nav_file(2)
    end, { desc = "file 2" })
    keymap("n", "<leader>hk", function()
      ui.nav_file(3)
    end, { desc = "file 3" })
    keymap("n", "<leader>hl", function()
      ui.nav_file(4)
    end, { desc = "file 4" })
    keymap("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    keymap(
      "n",
      "<leader>hp",
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      { desc = "Go to previous harpoon mark" })
  end,
}
