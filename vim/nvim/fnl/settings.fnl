(module settings
  {autoload {nvim aniseed.nvim}})

; TODO: Move to utils.
(defn set-options [modes name value]
  (each [_ mode (ipairs modes)]
    (let [mode_options (. vim mode)]
      (tset mode_options name value))))

; Set default indentation.
; Setting the global 'o' option does not override the settings on the
; first opened buffer, so we also need to set 'bo'.
; See: https://github.com/nanotee/nvim-lua-guide#caveats-3
(let [indent 2]
  (set-options ["o" "bo"] "tabstop" 2)
  (set-options ["o" "bo"] "shiftwidth" 2))

; Open vertical splits on the right.
(set-options ["o"] "splitright" true)
; Open horizontal splits below.
(set-options ["o"] "splitbelow" true)

; Use spaces instead of tabs.
(set nvim.g.expandtab true)
; Show line numbers.
(set nvim.wo.number true)
