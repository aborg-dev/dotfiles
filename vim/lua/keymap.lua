-- Global key mappings.

-- TODO: Shortcut to open vim config.

-- These keys serve as a prefix in many commands.
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Exit insert mode without going all the way to escape key!
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })

-- Jump between windows with less typing.
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Bindings to copy and paste to a named register.
-- When you yank without any modifier, text is placed into default register.
-- When you delete some text, it is also automatically placed into the default
-- register. This creates an unfortunate situation, when you can't paste with
-- replacement the same yanked text multiple times. By using a named register
-- we avoid this problem.
-- We use a special '+' register here that also corresponds to OS default clipboard,
-- so the text yanked this way can be pasted in other applications.
local modes = {'v', 'n'}
for i = 1, #modes do
  vim.api.nvim_set_keymap(modes[i], ',y', '"+y', { noremap = true, silent = true })
  vim.api.nvim_set_keymap(modes[i], ',p', '"+p', { noremap = true, silent = true })
end

-- Faster file saving.
vim.api.nvim_set_keymap('n', ',w', ':w<CR>', { noremap = true, silent = true })

-- Most of the plugins I use expose their shortcuts in a structured hierarchical
-- manner using which-key plugin. The configuration is incrementally extended in
-- the plugin-specific files. This file contains plugin-independent shortcuts.
local wk = require('which-key')

local keymap = {}

keymap.h = {
  name = '+help',
  -- TODO: Introduce recursive reloading?
  r = {':luafile %<CR>', 'reload config'},
}

keymap.b = {
  name = '+buffers',
  d = {':bd<CR>', 'delete'},
  n = {':bn<CR>', 'next'},
  p = {':bp<CR>', 'previous'},
}

wk.register(keymap, { prefix = "<leader>" })
