; Enable Rust code commands.
(module rust
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}})

(nvim.set_keymap :n :<localleader>ef ":RustRun<CR>" {:noremap true :silent true})

(wk.register
  ;; Project commands.
  {:p {:name "+project"
       :r [":RustRun<CR>" "run main"]
       :t [":RustTest!<CR>" "run all tests"]}}
  {:prefix "<leader>"})
