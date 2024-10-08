local settings = require "settings"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.scrolloff = 8
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.background = "light"
vim.cmd("colorscheme gruvbox")
