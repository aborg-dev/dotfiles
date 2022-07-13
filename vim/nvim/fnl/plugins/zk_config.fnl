(module zk_config
   {autoload {nvim aniseed.nvim}
    autoload {wk which-key}
    autoload {zk zk}})

(zk.setup {
  :picker "telescope"
  :lsp {
    :config {
      :cmd ["zk" "lsp"]
      :name "zk"
    }
    ;; Automatically attach buffers in a zk notebook that match the given filetypes.
    :auto_attach {
      :enabled true
      :filetypes ["markdown"]
    }
  }})

(wk.register
  {:n {:name "+notes"
       :f [":ZkNotes<CR>" "find note"]
       :t [":ZkTags<CR>" "find note by tag"]
       :c [":ZkNew { title = vim.fn.input('Title: ') }<CR>" "create note"]
       :d [":ZkNew { dir = 'diary', date = 'now' }<CR>" "open weekly diary"]}}
  {:prefix "<leader>"})
