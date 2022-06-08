--[[ Neo-Tre ]]--

-- Page Refresh

local map = vim.keymap.set
map("n", "qq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
map("i", "jj", "<Esc>", { desc = "Escape" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
map("n", "<leader>r", "<cmd>luafile%<Cr>", { desc = "Refresh Page" })
map("n", "<leader>e", "<cmd>Neotree<Cr>", { desc = "File Explorer" })

-- [[ Bufferline ]]
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
  map("n", ">b", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer tab right" })
  map("n", "<b", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer tab left" })
--[[  
--[[ I bufferline is not used
--map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" }) ]]

  --[[ Buffers ]]
 map("n", "<C-h>", function()
    require("smart-splits").move_cursor_left()
  end, { desc = "Move to left split" })
  map("n", "<C-j>", function()
    require("smart-splits").move_cursor_down()
  end, { desc = "Move to below split" })
  map("n", "<C-k>", function()
    require("smart-splits").move_cursor_up()
  end, { desc = "Move to above split" })
  map("n", "<C-l>", function()
    require("smart-splits").move_cursor_right()
  end, { desc = "Move to right split" })
  map("n", "<A-j>", function()
    require("smart-splits").resize_down()
  end, { desc = "Resize split down" })
  map("n", "<A-k>", function()
    require("smart-splits").resize_up()
  end, { desc = "Resize split up" })
  map("n", "<A-l>", function()
    require("smart-splits").resize_right()
  end, { desc = "Resize split right" })
  map("n", "<A-h>", function()
    require("smart-splits").resize_left()
  end, { desc = "Resize split left" })




-- GitSigns
-- 
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
