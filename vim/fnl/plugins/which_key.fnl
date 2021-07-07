(module which_key
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}})

(wk.setup {})

; The default timeout of 1 second is too large.
; So we overwrite the global setting that triggers after initial <Leader> keypress.
(set nvim.o.timeoutlen 300) ;; 300 milliseconds.
