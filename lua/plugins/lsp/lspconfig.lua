return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "b0o/SchemaStore.nvim",
      version = false, -- last release is way too old
    },
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    {
      "SmiteshP/nvim-navic",
      opts = function()
        return require("utils.icons").kinds
      end,
    },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
      -- keybind options
      local opts = { remap = false, silent = true, buffer = bufnr }
      local keymap = vim.keymap

      opts.desc = "show lsp definitions"
      keymap.set("n", "gd", "<cmd> Telescope lsp_definitions <CR>", opts)

      opts.desc = "go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "preview source"
      keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
      opts.desc = "global occurences"
      keymap.set("n", "<leader>lo", "<cmd> Telescope lsp_references <cr>", opts)

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      opts.desc = "show lsp type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "I", vim.lsp.buf.hover, opts)

      opts.desc = "Line Diagnostics"
      keymap.set("n", "dl", vim.diagnostic.open_float, opts)

      opts.desc = "diagnostics next occurence"
      keymap.set("n", "dn", vim.diagnostic.goto_next, opts)

      opts.desc = "diagnostics prev occurence"
      keymap.set("n", "dp", vim.diagnostic.goto_prev, opts)

      opts.desc = "format buffer"

      opts.desc = "code action"
      keymap.set("n", "gc", vim.lsp.buf.code_action, opts)

      opts.desc = "restart LSP"
      keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)

      opts.desc = "rename occurences"
      keymap.set("n", "gr", ":%s/\\<<C-r><C-w>\\>//g<left><left>", opts)

      opts.desc = "rename optional"
      keymap.set("n", "ga", ":%s/\\<<C-r><C-w>\\>//gc<left><left><left>", opts)

      -- Trouble
      opts.desc = "buffer diagnostics"
      keymap.set("n", "<leader>db", "<cmd>TroubleToggle document_diagnostics<cr>", opts)

      local function border(hl_name)
        return {
          { " ", hl_name },
          { " ", hl_name },
          { " ", hl_name },
          { " ", hl_name },
          { " ", hl_name },
          { " ", hl_name },
          { " ", hl_name },
          { " ", hl_name },
        }
      end

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border("CmpPmenu"),
        title = " ",
        --width = 60,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = border("CmpPmenu"),
        maxwidth = 60,
      })

      if client.name == "tsserver" then
        opts.desc = "Organise Imports"
        keymap.set("n", "<leader>fo", ":OrganizeImports <CR>", opts)
      end

      if client.name == "html" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end

      -- allow for nvim-navic
      if client.server_capabilities.documentSymbolProvider then
        vim.g.navic_silence = true
        require("nvim-navic").attach(client, bufnr)
      end
    end

    -- diagnostics config
    require("utils.diagnostics")

    local servers = require("plugins.lsp.servers.ensure_installed").lsp
    for _, server_name in ipairs(servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      }

      opts.capabilities.textDocument.completion.completionItem.snippetSupport = true

      local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.servers." .. server_name)
      if has_custom_opts then
        opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
      end
      --  P(lspconfig[server_name].document_config.default_config.cmd)
      lspconfig[server_name].setup(opts)
    end
    ----
  end,
}
