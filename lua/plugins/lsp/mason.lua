return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  opts = {
    PATH = "prepend",
    ui = {
      icons = {
        package_pending = " ",
        package_installed = "󰄳 ",
        package_uninstalled = " 󰚌",
      },
      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
        cancel_installation = "<C-c>",
      },
    },
    max_concurrent_installers = 10,
  },
  config = function(_, opts)
    -- import mason
    require("mason").setup(opts)

    require("mason-lspconfig").setup({
      automatic_installation = true,
      -- list of servers for mason to install
      ensure_installed = require("plugins.lsp.servers.ensure_installed").lsp,
    })

    require("mason-tool-installer").setup({
      ensure_installed = require("plugins.lsp.servers.ensure_installed").formatter_linters,
      run_on_start = true,
    })
  end,
}
