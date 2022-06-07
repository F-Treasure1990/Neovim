--[[ Neo-Tre ]]--

-- Page Refresh

local map = vim.keymap.set
map("n", "qq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
map("i", "jj", "<Esc>", { desc = "Escape" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
map("n", "<leader>r", "<cmd>luafile%<Cr>", { desc = "Refresh Page" })
map("n", "<leader>e", "<cmd>Neotree<Cr>", { desc = "File Explorer" })



-- GitSigns
--[[
if is_available "gitsigns.nvim" then
  map("n", "<leader>gj", function()
    require("gitsigns").next_hunk()
  end, { desc = "Next git hunk" })
  map("n", "<leader>gk", function()
    require("gitsigns").prev_hunk()
  end, { desc = "Previous git hunk" })
  map("n", "<leader>gl", function()
    require("gitsigns").blame_line()
  end, { desc = "View git blame" })
  map("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
  end, { desc = "Preview git hunk" })
  map("n", "<leader>gh", function()
    require("gitsigns").reset_hunk()
  end, { desc = "Reset git hunk" })
  map("n", "<leader>gr", function()
    require("gitsigns").reset_buffer()
  end, { desc = "Reset git buffer" })
  map("n", "<leader>gs", function()
    require("gitsigns").stage_hunk()
  end, { desc = "Stage git hunk" })
  map("n", "<leader>gu", function()
    require("gitsigns").undo_stage_hunk()
  end, { desc = "Unstage git hunk" })
  map("n", "<leader>gd", function()
    require("gitsigns").diffthis()
  end, { desc = "View git diff" })
end
]]
