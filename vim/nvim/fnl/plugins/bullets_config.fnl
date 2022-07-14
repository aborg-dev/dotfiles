(module bullets_config
   {autoload {nvim aniseed.nvim}
    autoload {wk which-key}})

(nvim.set_keymap :n :<C-Space> ":ToggleCheckbox<CR>" {:noremap true :silent true})
(nvim.set_keymap :n :<Leader><CR> ":InsertNewBullet<CR>" {:noremap true :silent true})
