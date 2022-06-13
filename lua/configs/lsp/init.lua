local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print("FAULT : lsp init")
end
require("luasnip.loaders.from_vscode").lazy_load()
--[[ require("luasnip.loaders.from_vscode").load({
	paths = "~/.config/nvim/lua/snippets/",
}) ]]
require("snippets")
require("configs.lsp.configs")
require("configs.lsp.handlers").setup()
--require'luasnip'.filetype_extend("javascript", {"html"})
--require'luasnip'.filetype_extend("typescriptreact", {"html"})
--require'luasnip'.filetype_extend("typescript", {"html"})
--require("luasnip.loaders.from_vscode").load({paths = {"../../snippets/snippets.json"}})

