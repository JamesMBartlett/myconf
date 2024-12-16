local map = vim.keymap.set
local set = vim.opt
local g = vim.g

map("n", " ", "<Nop>", { silent = true, remap = false })
map("v", " ", "<Nop>", { silent = true, remap = false })
g.mapleader = " "
g.maplocalleader = "\\"
set.smartindent = false
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

require("config.lazy")
require("config.pipe")
require("config.last_line")

set.background = "dark"
vim.cmd([[colorscheme gruvbox]])
set.number = true

map('n', "<leader>sp", ":set invpaste paste?<CR>")
