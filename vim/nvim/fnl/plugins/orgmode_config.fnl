(module orgmode_config
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}
   autoload {orgmode orgmode}})

(orgmode.setup {})

(print "orgmode_config loaded")
(do
  (nvim.ex.augroup :auFileTypes)
  ;; Deletes any old autocommands. Equivalent to ":au!".
  (nvim.ex.autocmd_)
  (nvim.ex.autocmd
    :FileType
    "org"
    "setlocal textwidth=100")
  (nvim.ex.augroup :END))
