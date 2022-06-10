local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print('FAULT : lsp init')
end

require('configs.lsp.configs')
require('configs.lsp.handlers').setup()
