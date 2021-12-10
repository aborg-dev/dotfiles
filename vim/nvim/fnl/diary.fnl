(module diary
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}})

(defn- go-to-last-char []
  (let [lines (nvim.buf_get_lines 0 0 -1 true)
        line_count (# lines)
        last_line_length (# (. lines line_count))]
    (nvim.win_set_cursor 0 [line_count last_line_length])))

(defn append_note []
  "Append a note to the current file."
  (go-to-last-char)
  (nvim.paste (.. "\n" (os.date "%H:%M")) true -1))

(wk.register
 ;; Commands to create notes.
 {:n {:name "+notes"
      :j [":lua require('diary').append_note()<CR>" "append note"]}}
 {:prefix "<leader>"})
