; Enable REPL-like evaluation for Python files.
(module pyrepl
  {autoload {nvim aniseed.nvim}})

(defn init []
   ;; Evaluates current file.
   ;; TODO: Derive Python version from the file shebang.
   (nvim.set_keymap :n :<localleader>ef ":!python3 %<CR>" {:noremap true :silent true}))

(do
  (nvim.ex.augroup :pyrepl)
  ;; Deletes any old autocommands. Equivalent to ":au!".
  (nvim.ex.autocmd_)
  (nvim.ex.autocmd
    :FileType
    "python"
    "lua require('fnl.pyrepl').init()")
  (nvim.ex.augroup :END))
