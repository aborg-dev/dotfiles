(local orgmode (require :orgmode))

(orgmode.setup_ts_grammar)
(orgmode.setup {
  ;; Don't indent lines in nested headings. This makes them easier to copy and
  ;; paste. In Emacs, they were indented only visually, but the text was still
  ;; starting from column 0.
  :org_indent_mode "noindent"
  :org_default_notes_file "~/notes/inbox.org"
  :org_agenda_files ["~/notes/inbox.org" "~/notes/mobile_inbox.org" "~/notes/week.org"]})
