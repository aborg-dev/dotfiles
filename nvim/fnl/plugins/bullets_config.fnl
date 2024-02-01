(vim.api.nvim_set_keymap :n :<C-Space> ":ToggleCheckbox<CR>" {:noremap true :silent true})
(vim.api.nvim_set_keymap :n :<C-CR> ":InsertNewBullet<CR>" {:noremap true :silent true})
(vim.api.nvim_set_keymap :i :<C-CR> "<esc>:InsertNewBullet<CR>" {:noremap true :silent true})
