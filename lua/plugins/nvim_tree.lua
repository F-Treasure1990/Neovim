return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  keys = {
    { "<leader>e", "<cmd> NvimTreeToggle <CR>", desc = "nvim tree" },
  },
  opts = {
    disable_netrw = false,
		hijack_netrw = true,
		hijack_cursor = false,
		hijack_unnamed_buffer_when_opening = false,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
    view = {
      adaptive_size = false,
      width = 40,
      preserve_window_proportions = true,
      relativenumber=false
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },
        glyphs = {
          default = "󰈚",
          symlink = "",
          folder = {
            default = "󰉋",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },
        },
      }
    },
    filters = {
      dotfiles = false,
      custom = { ".DS_Store" },
    },
    git = {
      ignore = false,
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
  },
  config = function(_, opts)
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    nvimtree.setup(opts)
    -- close neotree if its last window
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
          vim.cmd("quit")
        end
      end,
    })
  end
}
