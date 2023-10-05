return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    delay = 100,
    min_count_to_highlight = 2,
    filetypes_denylist = {
      ".DS_Store",
    },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)

    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("J", "next")
    map("K", "prev")
    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map("J", "next", buffer)
        map("K", "prev", buffer)
      end,
    })
  end,
  keys = {
    { "J", desc = "next reference" },
    { "K", desc = "prev reference" },
  },
}
