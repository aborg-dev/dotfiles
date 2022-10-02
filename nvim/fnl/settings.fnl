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
  (set-options ["o" "bo"] "tabstop" indent)
  (set-options ["o" "bo"] "shiftwidth" indent))

; Open vertical splits on the right.
(set-options ["o"] "splitright" true)
; Open horizontal splits below.
(set-options ["o"] "splitbelow" true)

; Use spaces instead of tabs.
(set nvim.g.expandtab true)
; Show line numbers.
(set nvim.wo.number true)
; Show visual indicator at given width.
(set nvim.wo.colorcolumn "100")

; Remember the folds in files.
(do
  (nvim.ex.augroup :remember_folds)
  ;; Deletes any old autocommands. Equivalent to ":au!".
  (nvim.ex.autocmd_)
  ;; We use "*.*" here to only match files with extensions as otherwise
  ;; the pattern also matches temporary buffers like Telescope windows
  ;; that don't work well with "mkview".
  (nvim.ex.autocmd :BufWinLeave "*.*" "mkview")
  (nvim.ex.autocmd :BufWinEnter "*.*" "silent! loadview")
  (nvim.ex.augroup :END))
