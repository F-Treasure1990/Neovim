return {
	"numTostr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local ft = require("Comment.ft")
		ft.set("astro", { "<!-- %s -->" })
		ft.set("typescriptreact", { "{/* %s */}" })
		require("Comment").setup({
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>cl",
				---Block-comment toggle keymap
				block = "<leader>cb",
			},
			opleader = {
				---Line-comment keymap
				line = "<leader>cl",
				---Block-comment keymap
				block = "<leader>cb",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "<leader>ck",
				---Add comment on the line below
				below = "<leader>cj",
				---Add comment at the end of line
				eol = "<leader>ce",
			},
		})
	end,
}
