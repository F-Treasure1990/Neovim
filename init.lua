local g = vim.g
g.mapleader = " " -- set leader key
g.do_filetype_lua = 1 -- use filetype.lua
g.did_load_filetypes = 0 -- don't use filetype.vim
g.highlighturl_enabled = true -- highlight URLs by default
require "plugins"
require "mappings"
-- Diagnostics Errors
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
require "colors"

vim.opt.fillchars:append { eob = " " } -- remove ~

local Options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  cursorline = true, -- highlight the current line
  copyindent = true, -- Copy the previous indentation on autoindenting
  expandtab = true, -- convert tabs to spaces
  fileencoding = "utf-8", -- the encoding written to a file
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  hlsearch = true, -- highlight all matches on previous search pattern
  history = 100,
  ignorecase = true, -- ignore case in search patterns
  laststatus = 2,
  mouse = "a", -- allow the mouse to be used in neovim
  number = true, -- set numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  pumheight = 10, -- pop up menu height
  preserveindent = true, -- Preserve indent structure as much as possible
  relativenumber = false, -- set relative numbered lines
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  scrolloff = 8, -- is one of my fav
  splitright = true, -- force all vertical splits to go to the right of current window
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  signcolumn = "number", -- where gutter signs will appear auto / "no" / "yes" / "number
  showmode = false, -- Disable showing modes in command line
  swapfile = false, -- creates a swapfile
  sidescrolloff = 8,
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
  tabstop = 2, -- insert 2 spaces for a tab
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  wrap = false, -- display lines as one long line
}


for k, v in pairs(Options) do
  vim.opt[k] = v
end

