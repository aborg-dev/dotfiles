-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.maplocalleader = ","
vim.opt.relativenumber = false -- Disable relative line numbers.
vim.opt.shell = "fish"
vim.opt.guifont = "JetBrainsMono Nerd Font:h19"

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

if vim.g.neovide then
  -- Lower value = faster animation.
  vim.g.neovide_cursor_animation_length = 0.02

  -- When in insert mode (mostly through i or a), the cursor will move like in other programs and immediately jump to its new position.
  vim.g.neovide_cursor_animate_in_insert_mode = false

  -- Enable delete word shortcut.
  vim.keymap.set({ "i", "c" }, "<C-BS>", "<C-W>", { noremap = true })

  -- Disable scrolling animation when moving more than one screen.
  vim.g.neovide_scroll_animation_far_lines = 0
end
