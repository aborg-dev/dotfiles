; Enable Godot code commands.
(module godot_config
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}})

(wk.register
  ;; Project commands.
  {:p {:name "+project"
       :r [":GodotRun<CR>" "run main scene"]}}
  {:prefix "<leader>"})
