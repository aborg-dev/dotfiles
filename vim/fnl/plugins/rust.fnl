; Enable Rust code commands.
(module rust
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<localleader>ef ":RustRun<CR>" {:noremap true :silent true})
