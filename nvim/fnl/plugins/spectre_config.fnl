(local wk (require :which-key))
(local spectre (require :spectre))
(local h (require :helpers))

(spectre.setup {})

(fn replace_word [] (spectre.open_visual {:select_word true}))
(fn replace_in_file [] (spectre.open_file_search {:select_word true}))

;; Search menu.
(wk.add (h.bind :<leader>r :+replace
                {:r [spectre.toggle :Replace]
                 :w [replace_word "Replace word"]
                 :p [replace_in_file "Replace in file"]}))

