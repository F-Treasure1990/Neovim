return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "▎" },
			topdelete = { text = "▎" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

        -- stylua: ignore start
        map("n", "<leader>ghn", gs.next_hunk, "Next Hunk")
        map("n", "<leader>ghp", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "stage")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "reset")
        map("n", "<leader>ga", gs.stage_buffer, "stage file")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "undo stage")
        map("n", "<leader>gr", gs.reset_buffer, "reset file")
        map("n", "<leader>ghp", gs.preview_hunk, "preview")
        map("n", "<leader>gp", function() gs.blame_line({ full = true }) end, "person")
        map("n", "<leader>gd", gs.diffthis, "diff This")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "diff ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
		end,
	},
}
