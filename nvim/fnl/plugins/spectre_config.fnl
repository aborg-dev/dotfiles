(local wk (require :which-key))
(local spectre (require :spectre))
(local h (require :helpers))

(spectre.setup {})

;; Search menu.
(wk.add (h.bind :<leader>r :+replace
                {;; Toggle search.
                 :r ["<cmd>lua require('spectre').toggle()<CR>" :toggle]
                 ;; Search a word.
                 :w ["<cmd>lua require('spectre').open_visual({select_word=true})<CR>"
                     :word]
                 ;; Search visual selection.
                 ;; TODO: Needs to be done in visual mode.
                 :v ["<cmd>lua require('spectre').open_visual()<CR>" :visual]
                 ;; Search on current file.
                 :p ["<cmd>lua require('spectre').open_file_search({select_word=true})<CR>"
                     :path]}))

