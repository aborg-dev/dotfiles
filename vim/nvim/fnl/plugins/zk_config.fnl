(module zk_config
   {autoload {nvim aniseed.nvim}
    autoload {wk which-key}
    autoload {zk zk}})

;; Copied from lsp.lua as I haven't found a way to reuse it.
(defn- on_attach [client bufnr]
  (vim.api.nvim_exec_autocmds "User" { :pattern "LspAttached" }))

(zk.setup {
  :picker "telescope"
  :lsp {
    :config {
      :cmd ["zk" "lsp"]
      :name "zk"
      :on_attach on_attach
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
       :c [":ZkNew { dir = 'roam', title = vim.fn.input('Title: ') }<CR>" "create note"]
       :d [":ZkNew { dir = 'diary', date = 'now' }<CR>" "open weekly diary"]}}
  {:prefix "<leader>"})
