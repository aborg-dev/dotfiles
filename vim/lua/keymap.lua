-- Global key mappings.

-- TODO: Shortcut to open vim config.

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

-- Bindings to copy and paste to a named register. 
-- When you yank without any modifier, text is placed into default register.
-- When you delete some text, it is also automatically placed into the default
-- register. This creates an unfortunate situation, when you can't paste with
-- replacement the same yanked text multiple times. By using a named register 
-- we avoid this problem.
-- We use a special '+' register here that also corresponds to OS default clipboard,
-- so the text yanked this way can be pasted in other applicatins.
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', {})
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', {})

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
