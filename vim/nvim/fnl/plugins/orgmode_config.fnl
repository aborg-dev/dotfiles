(module orgmode_config
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}
   autoload {orgmode orgmode}})

(orgmode.setup {
  ;; Don't indent lines in nested headings. This makes them easier to copy and
  ;; paste. In Emacs, they were indented only visually, but the text was still
  ;; starting from column 0.
  :org_indent_mode "noindent"})

(do
  (nvim.ex.augroup :auFileTypes)
  ;; Deletes any old autocommands. Equivalent to ":au!".
  (nvim.ex.autocmd_)
  (nvim.ex.autocmd
    :FileType
    "org"
    "setlocal textwidth=100")
  (nvim.ex.augroup :END))
