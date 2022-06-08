require('configs.packer')
require('packer').startup(function(use)
  --[[Packer]]--
  use 'wbthomason/packer.nvim'
  
 --[[ Colorizer ]]--
 use {
   'norcalli/nvim-colorizer.lua',
event = { "BufRead", "BufNewFile" },
config = function() 
  require"colorizer".setup()
end
 }

  --[[Neo-Tree]]-- 
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

 --[[ Bufferline ]]--
  use {
    "akinsho/bufferline.nvim",
    tag ="v2.*",
    after = "nvim-web-devicons",
    config = function()
      require("configs.bufferline").config()
    end
  }
  
use {
  "mrjones2014/smart-splits.nvim",
    module = "smart-splits",
    config = function()
      require "configs.smart-splits".config()
    end
  }
  end)
