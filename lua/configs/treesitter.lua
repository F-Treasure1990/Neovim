local treesitter_status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status_ok then
	print("FAULT : treesitter.lua")
end

treesitter.setup({
	ensure_installed = { "css", "javascript", "typescript", "tsx", "html", "scss" },
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
		  css = '// %s',
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
			typescript = { __default = '// %s', __multiline = '/* %s */' }
		},
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = nil,
	},
	autopairs = { enable = true },
	autotag = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = false },
})
