require('plugins')
-- Necessary for now as aniseed is loaded asynchronously, so we can't rely on
-- it for setting the compiled fennel module paths.
package.path = package.path .. ";" .. vim.fn.stdpath('config') .. "/lua/.compiled-lua/?.lua"
require('settings')
require('keymap')
require('pyrepl')

-- Visual settings.
-- TODO: Move to another file.
vim.cmd('colorscheme gruvbox')
vim.o.termguicolors = true
