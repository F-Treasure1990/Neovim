--	map("<leader>e", [[:lua require('vscode-neovim').notify('workbench.view.explorer')<CR>]], "file explorer")
local function map(keybind, setting, desc, cmd)
  if cmd == nil then
    vim.keymap.set("n", keybind, "<cmd>" .. setting .. "<CR>", { noremap = true, silent = true, desc = desc })
  elseif cmd then
    vim.keymap.set("n", keybind, setting, { noremap = true, silent = true, desc = desc })
  end
end
local function map_vsc(keybind, setting, desc)
  vim.keymap.set(
    "n",
    keybind,
    [[:lua require('vscode-neovim').notify(']] .. setting .. [[') <CR>]],
    { noremap = true, silent = true, desc = desc }
  )
end
if vim.g.vscode then
  local opt = vim.opt

  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  opt.clipboard = "unnamedplus" -- Sync with system clipboard

  -- vscode plugin is responsible for insert keymaps
  --map("daf", "<cmd> 1,$d <CR>", "delete file contents")

  map("<S-b>", "0", "Beginning of Line", true)
  map("<S-e>", "$", "End of line", true)

  map("yaf", "%y+", "yank file")
  map("daf", "1,$d", "delete file contents")
  map("daf", "1,$d", "delete file contents")

  -- map_vsc("<leader>/", "workbench.action.findInFiles", "Format File")

  print("Neovim Running...")
end
