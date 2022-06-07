require('configs.packer')
require('packer').startup(function(use)
  --[[Packer]]--
  use 'wbthomason/packer.nvim'

  --[[Neo-Tree]]-- File Explorer
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
end)
