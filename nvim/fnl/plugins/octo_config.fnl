(module diary
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}
   autoload {octo octo}})

(octo.setup {})

(wk.register
  ;; Github commands.
  {:g {:name "+github"
       :i [":Octo issue list<CR>" "issues"]
       :p [":Octo pr list<CR>" "pull requests"]
       :a [":Octo actions<CR>" "find action"]}}
  {:prefix "<leader>"})
