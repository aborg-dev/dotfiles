(module diary
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}
   autoload {ts_utils nvim-treesitter.ts_utils}})

(defn- go-to-last-char []
  (let [lines (nvim.buf_get_lines 0 0 -1 true)
        line_count (# lines)
        last_line_length (# (. lines line_count))]
    (nvim.win_set_cursor 0 [line_count last_line_length])))

(defn- current_weekday []
  (os.date "%A"))

(defn- current_time []
  (os.date "%H:%M"))

(defn- create_day_section [weekday]
  (nvim.paste (.. "\n* " weekday) true -1))

(defn- get_parse_tree_root [bufnr]
  (let [parser (vim.treesitter.get_parser bufnr "org")
        tree (parser:parse)
        first_tree (. tree 1)
        root (first_tree:root)]
    root))

(defn- get_top_level_sections [root]
  (icollect [child (root:iter_children)]
    (if (= (child:type) "section") child)))

(defn- get_section_title [section]
  (let [heading (section:named_child 0)
        item (heading:named_child 1)
        (s_row s_col e_row e_col) (item:range)
        text (nvim.buf_get_text 0 s_row s_col e_row e_col {})]
    (. text 1)))

(defn- find_weekday_heading [root weekday]
  (let [headings (icollect [_ section (ipairs (get_top_level_sections root))]
          (if (= (get_section_title section) weekday) section))]
    (match (length headings)
      0 nil
      1 (. headings 1)
      _ (error "Found more than one heading"))))

(defn- set_cursor_to_heading_end [heading]
  (let [(s_row s_col e_row e_col) (heading:range)
        last_line (nvim.buf_get_lines 0 (- e_row 1) e_row true)
        last_line_length (# (. last_line 1))]
    (nvim.win_set_cursor 0 [e_row last_line_length])))

(defn append_note []
  "Append a note to the current file."
  (local root (get_parse_tree_root 0))
  (local weekday (current_weekday))
  (local heading (find_weekday_heading root weekday))
  (when (= nil heading)
    (go-to-last-char)
    (create_day_section weekday))
  (local heading (find_weekday_heading root weekday))
  (set_cursor_to_heading_end heading)
  (nvim.paste (.. "\n" (current_time)) true -1))

(defn tail_node []
  "Inspects the current node"
  (local root (get_parse_tree_root 0))
  (local weekday (current_weekday))
  (local heading (find_weekday_heading root weekday))
  (set_cursor_to_heading_end heading))

(wk.register
 ;; Commands to create notes.
 {:n {:name "+notes"
      :j [":lua require('diary').append_note()<CR>" "append note"]
      :i [":lua require('diary').tail_node()<CR>" "tail node"]}}
 {:prefix "<leader>"})
