(module init
  {autoload {nvim aniseed.nvim}})

; Set default indentation.
(let [indent 2]
  (set nvim.o.tabstop indent)
  (set nvim.o.shiftwidth indent))

; Use spaces instead of tabs.
(set nvim.g.explandtab true)
; Show line numbers.
(set nvim.wo.number true)
