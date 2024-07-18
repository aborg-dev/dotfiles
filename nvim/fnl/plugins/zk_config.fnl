(local wk (require :which-key))
(local zk (require :zk))
(local h (require :helpers))

;; Copied from lsp.lua as I haven't found a way to reuse it.
(fn on_attach [client bufnr]
  (vim.api.nvim_exec_autocmds :User {:pattern :LspAttached}))

(zk.setup {:picker :telescope
           :lsp {:config {:cmd [:zk :lsp] :name :zk : on_attach}
                 ;; Automatically attach buffers in a zk notebook that match the given filetypes.
                 :auto_attach {:enabled true :filetypes [:markdown]}}})

(wk.add (h.bind :<leader>n :+notes
                {:f [":ZkNotes { tags = { 'NOT weekly' } }<CR>" "find note"]
                 :r [":ZkNotes { tags = { 'weekly' }, sort = { 'created' } }<CR>"
                     "find weekly note"]
                 :t [":ZkTags<CR>" "find note by tag"]
                 :c [":ZkNew { dir = 'roam', title = vim.fn.input('Title: ') }<CR>"
                     "create note"]
                 :d [":ZkNew { dir = 'diary', date = 'now' }<CR>"
                     "open weekly diary"]}))

