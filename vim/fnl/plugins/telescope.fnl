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
      }}}})

(wk.register 
  {" " [":lua require('telescope.builtin').find_files({previewer = false})<CR>" "find_files"]
   ;; 'show_all_buffers = true' is needed to also show hidden buffers.
   "," [":lua require('telescope.builtin').buffers({show_all_buffers = true})<CR>" "buffers"]}
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
       :c [":lua require('telescope.builtin').command_history()<CR>" "command history"]}}
  {:prefix "<leader>"})
