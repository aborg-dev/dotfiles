-- [nfnl] Compiled from fnl/keymap.fnl by https://github.com/Olical/nfnl, do not edit.
local wk = require("which-key")
local h = require("helpers")
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.api.nvim_set_keymap("i", "kj", "<esc>", {noremap = true, silent = true})
wk.add(h.bind("<localleader>", "LocalLeader", {w = {":w<CR>", "Save"}, y = {"\"+y", "Copy", "nv"}, p = {"\"+p", "Paste", "nv"}, q = {":q<CR>", "Exit"}}))
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", {noremap = true, silent = true})
return vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", {noremap = true, silent = true})
