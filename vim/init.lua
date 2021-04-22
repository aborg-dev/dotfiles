require('plugins')
require('keymap')

-- Editing settings.
local indent = 2
vim.o.tabstop = indent
vim.o.shiftwidth = indent
vim.o.expandtab = true      -- Use spaces instead of tabs.
vim.wo.number = true        -- Show line numbers.

-- Visual settings.
-- TODO: Move to another file.
vim.cmd('colorscheme gruvbox')
vim.o.termguicolors = true
