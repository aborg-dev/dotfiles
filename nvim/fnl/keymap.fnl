; This file contains global mappings that don't belong to any plugin.
(local wk (require :which-key))
(local h (require :helpers))

;; These keys serve as a prefix in many commands.
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

;; Exit insert mode without going all the way to escape key!
(vim.api.nvim_set_keymap :i :kj :<esc> {:noremap true :silent true})

(wk.add (h.bind :<localleader> :LocalLeader
                {;; Faster file saving.
                 :w [":w<CR>" :Save]
                 ;; Copy/paste to OS clipboard.
                 :y ["\"+y" :Copy :n]
                 :p ["\"+p" :Paste :n]
                 ;; Navigate search list.
                 :cn [":cnext<CR>" :NextSearch]
                 :cp [":cprev<CR>" :PrevSearch]
                 ;; Faster file exit.
                 :q [":q<CR>" :Exit]}))

;; TODO: Figure out how to merge this with binding above.
(wk.add (h.bind :<localleader> :LocalLeader
                {:y ["\"+y" :Copy :v] :p ["\"+p" :Paste :v]}))

;; Jumping out of terminal window to other vim splits.
(vim.api.nvim_set_keymap :t :<C-h> "<C-\\><C-n><C-w>h"
                         {:noremap true :silent true})

(vim.api.nvim_set_keymap :t :<C-j> "<C-\\><C-n><C-w>j"
                         {:noremap true :silent true})

(vim.api.nvim_set_keymap :t :<C-k> "<C-\\><C-n><C-w>k"
                         {:noremap true :silent true})

(vim.api.nvim_set_keymap :t :<C-l> "<C-\\><C-n><C-w>l"
                         {:noremap true :silent true})

