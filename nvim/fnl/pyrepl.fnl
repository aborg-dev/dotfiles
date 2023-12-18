;; Enable REPL-like evaluation for Python files.
(local wk (require :which-key))

(fn init []
   ;; Evaluates current file.
   ;; TODO: Derive Python version from the file shebang.
   (vim.api.nvim_set_keymap :n :<localleader>ef ":!python3 %<CR>" {:noremap true :silent true})
   (wk.register
     ;; Project commands.
     {:p {:name "+project"
          :r [":!poetry run python main.py<CR>" "run main"]
          :t [":!poetry run pytest<CR>" "run all tests"]}
      :c {:name "+code"
          :f [":!poetry run black %<CR>:e<CR>" "format code in a buffer"]}}
     {:prefix "<leader>"}))

; (do
;   (nvim.ex.augroup :pyrepl)
;   ;; Deletes any old autocommands. Equivalent to ":au!".
;   (nvim.ex.autocmd_)
;   (nvim.ex.autocmd
;     :FileType
;     "python"
;     "lua require('pyrepl').init()")
;   (nvim.ex.augroup :END))
