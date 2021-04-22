-- Global key mappings.

-- TODO: Shortcut to open vim config.
-- TODO: Replace shouldn't replace yank buffer.
-- TODO: Allow pasting same thing many times
-- {'p', '""p:let @"=@0<CR>'},

-- These keys serve as a prefix in many commands.
vim.g.mapleader = " "
vim.g.localmapleader = ","

-- Exit insert mode without going all the way to escape key!
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })

-- Jump between windows with less typing.
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Most of the plugins I use expose their shortcuts in a structured hierarchical
-- manner using which-key plugin. The configuration is incrementally extended in
-- the plugin-specific files. This file contains plugin-independent shortcuts.
local wk = require('whichkey_setup')

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

wk.register_keymap('leader', keymap)
