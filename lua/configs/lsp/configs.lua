local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	print("FAULT: Lsp.Configs")
end

local lspconfig = require("lspconfig")

local servers = require("nvim-lsp-installer").get_installed_servers()

lsp_installer.setup({
	ensure_installed = servers.name,
})
for _, server in pairs(servers) do
	local opts = {
		on_attach = require("configs.lsp.handlers").on_attach,
		capabilities = require("configs.lsp.handlers").capabilities,
		flags = {
			-- This will be the default in neovim 0.7+
			debounce_text_changes = 150,
		},
	}

	local has_custom_opts, server_custom_opts = pcall(require, "configs.lsp.settings." .. server.name)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	else 
	  
	end

	lspconfig[server.name].setup(opts)
end
