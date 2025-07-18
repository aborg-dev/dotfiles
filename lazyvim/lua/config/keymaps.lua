-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Common buffer shortcuts.
vim.keymap.set("n", "<C-s>", ":write<cr>", { silent = true })
vim.keymap.set("n", "<C-q>", ":quit<cr>", { silent = true })

-- System clipboard cut and paste.
vim.keymap.set("n", "<localleader>y", '"+y', { silent = true })
vim.keymap.set("n", "<localleader>p", '"+p', { silent = true })

-- Easier to exit insert mode.
vim.keymap.set("i", "kj", "<esc>")

-- Switch between tabs with Ctrl-Tab
vim.keymap.set({ "n", "t" }, "<C-Tab>", ":tabnext<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-S-Tab>", ":tabprev<CR>", { silent = true })
