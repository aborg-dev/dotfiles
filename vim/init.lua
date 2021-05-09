require('plugins')
-- To resolve paths to all modules we rely on aniseed plugin to set
-- correct package.path. For some reason the init.lua is loaded twice,
-- once before and once after all plugins are loaded. Hence we add a check
-- to load modules only after plugins have been loaded.
-- Pretty ugly, I know, ideally we would force aniseed loading out of band.
if rawget(_G, 'packer_plugins') ~= nil then
	require('settings')
	require('keymap')
	require('pyrepl')
end

-- Visual settings.
-- TODO: Move to another file.
vim.cmd('colorscheme gruvbox')
vim.o.termguicolors = true
