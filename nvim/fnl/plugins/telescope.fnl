(module keymap
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}
   autoload {telescope telescope}
   autoload {actions telescope.actions}})

(telescope.setup {
  ;; This is global remapping across all pickers.
  :defaults {
    :mappings {
      :i {
        :<C-j> actions.move_selection_next
        :<C-k> actions.move_selection_previous
      }}}
  :pickers {
    :find_files {
      :theme "ivy"
      :previewer false
      :layout_config {
        :height 0.4
      }}
    :buffers {
      :theme "ivy"
      :previewer false
      ;; 'show_all_buffers = true' is needed to also show hidden buffers.
      :show_all_buffers true
      :layout_config {
        :height 0.4
      }}
    }})

(wk.register 
  {" " [":lua require('telescope.builtin').find_files()<CR>" "find_files"]
   "," [":lua require('telescope.builtin').buffers()<CR>" "buffers"]}
  {:prefix "<leader>"})

(wk.register 
  ;; Help menu.
  {:h {:name "+help"
       :b [":lua require('telescope.builtin').keymaps()<CR>" "key bindings"]
       :o [":lua require('telescope.builtin').vim_options()<CR>" "vim options"]
       :t [":lua require('telescope.builtin').help_tags()<CR>" "help tags"]}}
  {:prefix "<leader>"})

(wk.register 
  ;; Search menu.
  {:s {:name "+search"
       :s [":lua require('telescope.builtin').live_grep()<CR>" "live_grep"]
       :w [":lua require('telescope.builtin').grep_string()<CR>" "grep_string"]
       :c [":lua require('telescope.builtin').command_history()<CR>" "command history"]
       :r [":lua require('telescope.builtin').lsp_references()<CR>" "symbol references"]
       :f [":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>" "workspace symbols"]
       :d [":lua require('telescope.builtin').lsp_document_symbols()<CR>" "document symbols"]}}
  {:prefix "<leader>"})
