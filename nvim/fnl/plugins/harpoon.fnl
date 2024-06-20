(local wk (require :which-key))
(local harpoon (require :harpoon))

(harpoon:setup {})

(fn harpoon-list []
  ((harpoon:list):add))

;; Git menu.
(wk.register 
  {:l {:name "+harpoon"
       :a [":lua require('harpoon'):list():add()<CR>" "Add"]
       ; :a [harpoon-list "Add"]
       :f [":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>" "List"]
       ; :c [":G commit<CR>" "Commit"]
       }}
  {:prefix "<leader>"})
 
(wk.register 
  {:<C-S-P> [":lua require('harpoon'):list():prev()<CR>" "prev"]
   :<C-S-N> [":lua require('harpoon'):list():next()<CR>" "next"]})

; vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
; vim.keymap.set("n", "<leader>f", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
;
; vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
; vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
; vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
; vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
;
; -- Toggle previous & next buffers stored within Harpoon list
; vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
; vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
