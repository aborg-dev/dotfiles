(local ts (require :nvim-treesitter.configs))

(ts.setup {
  ;; One of "all", "maintained" (parsers with maintainers), or a list of languages.
  :ensure_installed ["toml" "rust" "org" "fennel" "lua" "terraform" "markdown" "markdown_inline"]
  ;; List of parsers to ignore installing.
  :ignore_install []
  ;; Extensions to set up.
  :highlight {
    :enable true
    :additional_vim_regex_highlighting ["org"]}})

; TODO: Find a way to enable this only to the languages I need.
; (set nvim.o.foldmethod "expr")
; (set nvim.o.foldexpr "nvim_treesitter#foldexpr()")
