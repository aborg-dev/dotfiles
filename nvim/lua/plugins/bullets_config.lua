-- [nfnl] Compiled from fnl/plugins/bullets_config.fnl by https://github.com/Olical/nfnl, do not edit.
vim.api.nvim_set_keymap("n", "<C-Space>", ":ToggleCheckbox<CR>", {noremap = true, silent = true})
return vim.api.nvim_set_keymap("n", "<Leader><CR>", ":InsertNewBullet<CR>", {noremap = true, silent = true})
