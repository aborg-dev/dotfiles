; This file contains global mappings that don't belong to any plugin.
(local wk (require :which-key))

;; These keys serve as a prefix in many commands.
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

;; Exit insert mode without going all the way to escape key!
(vim.api.nvim_set_keymap :i :kj :<esc> {:noremap true :silent true})

;; Bindings to copy and paste to a named register.
;; When you yank without any modifier, text is placed into default register.
;; When you delete some text, it is also automatically placed into the default
;; register. This creates an unfortunate situation, when you can't paste with
;; replacement the same yanked text multiple times. By using a named register
;; we avoid this problem.
;; We use a special '+' register here that also corresponds to OS default clipboard,
;; so the text yanked this way can be pasted in other applications.
(each [_ mode (ipairs [:v :n])]
  (do
    (vim.api.nvim_set_keymap mode :<localleader>y "\"+y"
                             {:noremap true :silent true})
    (vim.api.nvim_set_keymap mode :<localleader>p "\"+p"
                             {:noremap true :silent true})))

;; Faster file saving.
(vim.api.nvim_set_keymap :n :<localleader>w ":w<CR>"
                         {:noremap true :silent true})

;; Faster file exit.
(vim.api.nvim_set_keymap :n :<localleader>q ":q<CR>"
                         {:noremap true :silent true})

;; Jumping out of terminal window to other vim splits.
(vim.api.nvim_set_keymap :t :<C-h> "<C-\\><C-n><C-w>h"
                         {:noremap true :silent true})

(vim.api.nvim_set_keymap :t :<C-j> "<C-\\><C-n><C-w>j"
                         {:noremap true :silent true})

(vim.api.nvim_set_keymap :t :<C-k> "<C-\\><C-n><C-w>k"
                         {:noremap true :silent true})

(vim.api.nvim_set_keymap :t :<C-l> "<C-\\><C-n><C-w>l"
                         {:noremap true :silent true})

