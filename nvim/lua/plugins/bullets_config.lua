-- [nfnl] Compiled from fnl/plugins/bullets_config.fnl by https://github.com/Olical/nfnl, do not edit.
module(bullets_config, {[autoload] = {[wk] = __fnl_global__which_2dkey}})
nvim.set_keymap("n", "<C-Space>", ":ToggleCheckbox<CR>", {noremap = true, silent = true})
return nvim.set_keymap("n", "<Leader><CR>", ":InsertNewBullet<CR>", {noremap = true, silent = true})
