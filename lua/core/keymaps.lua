local map = vim.keymap.set

map("n", "<leader>;", "<cmd>Telescope command_history<cr>", { desc = "command history" }) -- telescope command history
map("i", "jj", "<ESC>", { silent = true, desc = "exit insert mode" }) -- escape

--map({ "n", "v" }, "<S-b>", "0", { desc = "Beginning of Line" }) -- move cursor beginning of line
--map({ "n", "v" }, "<S-e>", "$", { desc = "End of line" }) -- move cursor end of line

map({ "v", "n" }, "yaf", "<cmd> %y+ <CR>", { desc = "yank file" }) -- yank whole file

map({ "v", "n" }, "<leader>sn", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" }) -- escape word searched

map({ "v", "n", "s" }, "<leader>fs", "<cmd>w<cr><esc>", { desc = "save" }) -- save file
map({ "v", "n" }, "yl", "y$", { desc = "yank to end line" }) -- yanks to end of line

map("n", "<leader>sw", "<Plug>(nvim-surround-normal)", { desc = "surround word" })
-- windows
--map("n", "<leader>ww", "<C-W>p", { desc = "other window" })
map("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>wd", "<C-W>c", { desc = "window close" })
map("n", "<leader>w-", "<C-W>s", { desc = "window split below" })
map("n", "<leader>w\\", "<C-W>v", { desc = "window split  right" })
-- windows resizing
map("n", "<S-k>", "<cmd>resize +4<cr>", { desc = "increase height" })
map("n", "<S-j>", "<cmd>resize -4<cr>", { desc = "decrease height" })
map("n", "<S-h>", "<cmd>vertical resize -4<cr>", { desc = "decrease width" })
map("n", "<S-l>", "<cmd>vertical resize +4<cr>", { desc = "increase width" })

map("n", "<leader>ol", "<cmd>:Lazy<cr>", { desc = "Lazy" }) -- lazy
map("n", "<leader>om", "<cmd>Mason<cr>", { desc = "Mason" })

map("n", "<leader>of", "<cmd>enew<cr>", { desc = "New File" }) -- new file

map("n", "<tab>", "<C-6>", { desc = "prev buffer" }) -- return to previous buffer

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" }) -- quitkey

map("n", "<leader>vi", vim.show_pos, { desc = "Hl Inspect" }) -- highlight inspect

-- better indenting
map({ "v", "n" }, "<", "<gv") -- indent highlighted section backwards
map({ "v", "n" }, ">", ">gv") -- indent highlighted section forwards

map("v", "K", ":m '<-2<CR>gv=gv") -- move highlighted line up
map("v", "J", ":m '>+1<CR>gv=gv") -- move highlighted line down
