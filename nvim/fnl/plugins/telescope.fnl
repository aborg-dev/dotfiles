(local wk (require :which-key))
(local actions (require :telescope.actions))
(local telescope (require :telescope))
(local h (require :helpers))

(telescope.setup {;; This is global remapping across all pickers.
                  :defaults {:mappings {:i {:<C-j> actions.move_selection_next
                                            :<C-k> actions.move_selection_previous}}}
                  :pickers {:find_files {:theme :ivy
                                         :previewer false
                                         :layout_config {:height 0.4}}
                            :buffers {:theme :ivy
                                      :previewer false
                                      ;; 'show_all_buffers = true' is needed to also show hidden buffers.
                                      :show_all_buffers true
                                      :layout_config {:height 0.4}}}})

(fn call [telescope_builtin_name]
  (.. ":lua require('telescope.builtin')." telescope_builtin_name "()<CR>"))

;; Quick jump to files and buffers.
(wk.add (h.bind :<leader> :+telescope
                {" " [(call :find_files) :find_files]
                 "," [(call :buffers) :buffers]}))

;; Help menu.
(wk.add (h.bind :<leader>h :+help
                {:b [(call :keymaps) "key bindings"]
                 :o [(call :vim_options) "vim options"]
                 :t [(call :help_tags) "help tags"]}))

;; Search menu.
(wk.add (h.bind :<leader>s :+search
                {:s [(call :live_grep) :live_grep]
                 :w [(call :grep_string) :grep_string]
                 :c [(call :command_history) "command history"]
                 :r [(call :lsp_references) "symbol references"]
                 :f [(call :lsp_dynamic_workspace_symbols) "workspace symbols"]
                 :d [(call :lsp_document_symbols) "document symbols"]}))

