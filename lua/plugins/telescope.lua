return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ThePrimeagen/harpoon",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>/", "<cmd> Telescope live_grep <CR>", desc = "grep" },
    { "<leader><space>", "<cmd> Telescope find_files hidden=true<CR>", desc = "find files" },

    -- [[ Find ]] --
    { "<leader>fr", "<cmd>Telescope oldfiles previewer=false<cr>", desc = "recent" },
    {
      "<leader>fw",
      "<cmd>Telescope lsp_document_symbols symbols=Class,Function,Method,Constructor,Interface,Module,Struct <cr>",
      desc = "workspace symbols",
    },
    -- [[ Git ]] --
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
    { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "branches" },

    -- [[ Words ]] --
    { "<leader>sj", "]s", desc = "next spell error" },
    { "<leader>sk", "[s", desc = "prev spell error" },
    { "<leader>ss", "<cmd>Telescope spell_suggest<cr>", desc = "spell suggest" },
    { "<leader>sa", "zg", desc = "add to spell list" },

    -- [[ Vim ]] --
    { "<leader>vk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>vc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>vt", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>vh", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
    { "<leader>vo", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    { "<leader>va", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },

    -- [[ Diagnostics ]] --
    { "<leader>dg", "<cmd>Telescope diagnostics<cr>", desc = "Global" },

    -- [[ UI ]] --
    { "<leader>uc", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
    { "<leader>ut", "<cmd>Telescope treesitter<cr>", desc = "Treesitter Symbols" },
  },
  opts = function()
    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    local actions_state = require("telescope.actions.state")

    return {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        path_display = { "truncate " },
        selection_caret = " ",
        prompt_prefix = " ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
          width = 0.8,
          height = 0.5,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-p>"] = actions_layout.toggle_preview,
            ["<C-j>"] = function(...)
              return actions.preview_scrolling_down(...)
            end,
            ["<C-k>"] = function(...)
              return actions.preview_scrolling_up(...)
            end,
            ["<C-h>"] = function(promp_bufnr)
              actions_state.get_current_picker(promp_bufnr).tester = false
              return require("telescope.builtin").find_files({
                hidden = true,
                no_ignore = true,
              })
            end,
          },
          n = {
            ["<C-p>"] = actions_layout.toggle_preview,
          },
        },
      },
      pickers = {
        find_files = {
          previewer = true,
          path_display = function(_, path)
            local tail = require("telescope.utils").path_tail(path)
            local find_file_in_path = string.gsub(path, "/" .. tail, "")
            if find_file_in_path == tail then
              return string.format("%s", tail)
            end
            return string.format("%s ..( %s )", tail, find_file_in_path)
          end,
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    require("telescope").load_extension("harpoon")
  end,
}
