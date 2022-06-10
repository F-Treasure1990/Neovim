require('configs.packer')
require('packer').startup(function(use)

  --[[Packer]] --
  use 'wbthomason/packer.nvim'

  --[[ Colorizer ]] --
  use {
    'norcalli/nvim-colorizer.lua',
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "colorizer".setup()
    end
  }

  --[[Neo-Tree]] --
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    cmd = "Neotree",
    requires = {
      "nvim-lua/plenary.nvim", -- a function libary for the plugin
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim", -- ui componenet libary
    },
    setup = function()
      vim.g.neo_tree_remove_legacy_commands = true
    end,
    config = function()
      require('configs.neo-tree').config()
    end
  }

  --[[ Bufferline ]] --
  use {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    after = "nvim-web-devicons",
    config = function()
      require("configs.bufferline").config()
    end
  }

  --[[ Smart-Splits ]]
  use {
    "mrjones2014/smart-splits.nvim",
    module = "smart-splits",
    config = function()
      require "configs.smart-splits".config()
    end
  }

  --[[ Bufdelete]]
  use {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" }
  }

  use {
    'nvim-lualine/lualine.nvim',
    after = "nvim-web-devicons",
    config = function()
      require("configs.lualine").config()
    end,
  }
  --[[ LSP ]]
  use {
    "neovim/nvim-lspconfig",
    event = { "VimEnter" }
  }
  use {
    "williamboman/nvim-lsp-installer",
    after = "nvim-lspconfig",
    config = function()
      require "configs.lsp-installer"
      require "configs.lsp"
    end
  }
end)
