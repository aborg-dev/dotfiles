-- [nfnl] Compiled from fnl/keymap.fnl by https://github.com/Olical/nfnl, do not edit.
local wk = require("which-key")
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.api.nvim_set_keymap("i", "kj", "<esc>", {noremap = true, silent = true})
for _, mode in ipairs({"v", "n"}) do
  vim.api.nvim_set_keymap(mode, "<localleader>y", "\"+y", {noremap = true, silent = true})
  vim.api.nvim_set_keymap(mode, "<localleader>p", "\"+p", {noremap = true, silent = true})
end
vim.api.nvim_set_keymap("n", "<localleader>w", ":w<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<localleader>q", ":q<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", {noremap = true, silent = true})
return vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", {noremap = true, silent = true})
