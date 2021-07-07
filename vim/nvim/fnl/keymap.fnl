; This file contains global mappings that don't belong to any plugin.
(module keymap
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}})

;; These keys serve as a prefix in many commands.
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; Exit insert mode without going all the way to escape key!
(nvim.set_keymap :i :kj :<esc> {:noremap true :silent true})

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
    (nvim.set_keymap mode :<localleader>y "\"+y" {:noremap true :silent true})
    (nvim.set_keymap mode :<localleader>p "\"+p" {:noremap true :silent true})))

;; Faster file saving.
(nvim.set_keymap :n :<localleader>w ":w<CR>" {:noremap true :silent true})

;; Jumping out of terminal window to other vim splits.
(nvim.set_keymap :t :<C-h> :<C-\><C-n><C-w>h {:noremap true :silent true})
(nvim.set_keymap :t :<C-j> :<C-\><C-n><C-w>j {:noremap true :silent true})
(nvim.set_keymap :t :<C-k> :<C-\><C-n><C-w>k {:noremap true :silent true})
(nvim.set_keymap :t :<C-l> :<C-\><C-n><C-w>l {:noremap true :silent true})

;; Help menu.
(wk.register 
  {:h {:name "+help"
       :s [":luafile %<CR> | :PackerSync<CR>" "sync plugins"]
       ;;; TODO: Introduce recursive reloading?
       :r [":luafile %<CR>" "reload config"]}}
  {:prefix "<leader>"})

;; Shortcuts to manipulate buffers.
(wk.register 
  {:b {:name "+buffers"
       :d [":bd<CR>" "delete"]
       :n [":bn<CR>" "next"]
       :p [":bp<CR>" "previous"]}}
  {:prefix "<leader>"})
