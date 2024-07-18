(local wk (require :which-key))
(local h (require :helpers))

;; Git menu.
(wk.add (h.bind :<leader>g :+git
                {:g [":G<CR>" :Status]
                 :d [":G diff<CR>" :Diff]
                 :l [":G log<CR>" :Log]
                 :p [":G push<CR>" :Push]
                 :a [":G commit --amend<CR>" :Amend]
                 :c [":G commit<CR>" :Commit]}))

