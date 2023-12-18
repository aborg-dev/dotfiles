(local wk (require :which-key))

(wk.setup {})

; The default timeout of 1 second is too large.
; So we overwrite the global setting that triggers after initial <Leader> keypress.
(set vim.o.timeoutlen 300) ;; 300 milliseconds.
