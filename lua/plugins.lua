require("configs.packer")
require("packer").startup(function(use)
	--[[Packer]]
	--
	use("wbthomason/packer.nvim")

	--[[ Colorizer ]]
	--
	use({
		"norcalli/nvim-colorizer.lua",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("colorizer").setup()
		end,
	})
	--[[ Telescope ]]
	--
	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = "telescope",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.telescope")
		end,
	})

	--[[ Alpha ]]
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("configs.alpha")
		end,
	})
	--[[ Neo-Tree ]]
	--
	use({
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
			require("configs.neo-tree").config()
		end,
	})
	--[[ Autopairs ]]
	--
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("configs.autopairs")
		end,
	})

	--[[ Treesitter ]]
	-- Parenthesis highlighting
	use({
		"p00f/nvim-ts-rainbow",
		after = "nvim-treesitter",
	})
	use({
		"numToStr/Comment.nvim",
		after = "nvim-treesitter",
		config = function()
			require("configs.comment")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = { "BufRead", "BufNewFile" },
		cmd = {
			"TSInstall",
			"TSInstallInfo",
			"TSInstallSync",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSDisableAll",
			"TSEnableAll",
		},
		config = function()
			require("configs.treesitter")
		end,
	})

	--[[ Bufferline ]]
	--
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		after = "nvim-web-devicons",
		config = function()
			require("configs.bufferline").config()
		end,
	})

	--[[ Snippets ]]
	use({
		"L3MON4D3/LuaSnip",
		module = "luasnip",
	})

	--[[ Cmp ]]
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("configs.cmp")
		end,
	})

	-- Snippet completion source
	use({
		"saadparwaiz1/cmp_luasnip",
		after = "nvim-cmp",
	})

	-- Buffer completion source
	use({
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
	})

	-- Path completion source
	use({
		"hrsh7th/cmp-path",
		after = "nvim-cmp",
	})

	-- LSP completion source
	use({
		"hrsh7th/cmp-nvim-lsp",
		after = "nvim-cmp",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("configs.lsp.null-ls")
		end,
	})
	--[[ Smart-Splits ]]
	use({
		"mrjones2014/smart-splits.nvim",
		module = "smart-splits",
		config = function()
			require("configs.smart-splits").config()
		end,
	})

	--[[ Bufdelete]]
	use({
		"famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
	})

	use({
		"nvim-lualine/lualine.nvim",
		after = "nvim-web-devicons",
		config = function()
			require("configs.lualine").config()
		end,
	})
	--[[ LSP ]]
	use({
		"neovim/nvim-lspconfig",
		event = { "VimEnter" },
	})

	use({
		"williamboman/nvim-lsp-installer",
		after = "nvim-lspconfig",
		config = function()
			require("configs.lsp-installer")
			require("configs.lsp")
		end,
	})
	use({
		"onsails/lspkind.nvim",
	})
	--react snipppets
	use({
		"dsznajder/vscode-es7-javascript-react-snippets",
		after = "nvim-cmp",
		run = "yarn install --frozen-lockfile && yarn compile",
	})
end)
