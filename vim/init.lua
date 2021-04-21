require('plugins')

-- Editing settings.
vim.o.tabstop = 4
vim.o.shiftwidth = vim.o.tabstop

-- Visual settings.
vim.cmd('colorscheme gruvbox')
vim.o.termguicolors = true

-- TODO: Shortcut to jump another split with Ctrl-l.
-- TODO: Shortcut to reload configs.
-- TODO: Shortcut to choose telescope results with Ctrl-j, Ctrl-k

-- Keybindings.
vim.g.mapleader = " "
vim.g.localmapleader = ","

local wk = require('whichkey_setup')

local keymap = {
    -- 'show_all_buffers = true' is needed to also show hidden buffers.
    [","] = {':lua require("telescope.builtin").buffers({show_all_buffers = true})<CR>', 'buffers'},
    [" "] = {':lua require("telescope.builtin").find_files()<CR>', 'find_files'},
    -- [" "] = {':lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({ winblend = 10 }))<CR>', 'find_files'},
}

keymap.s = {
	name = '+search',
        s = {':lua require("telescope.builtin").live_grep()<CR>', 'live_grep'},
        c = {':lua require("telescope.builtin").command_history()<CR>', 'command history'},
}

keymap.h = {
	name = '+help',
	b = {':lua require("telescope.builtin").keymaps()<CR>', 'key bindings'},
	o = {':lua require("telescope.builtin").vim_options()<CR>', 'vim options'},
	t = {':lua require("telescope.builtin").help_tags()<CR>', 'help tags'},
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

