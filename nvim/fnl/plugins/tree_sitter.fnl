(local tree_sitter_configs (require :nvim-treesitter.configs))
(require :nvim-treesitter.parsers)

(tree_sitter_configs.setup {
  ;; One of "all", "maintained" (parsers with maintainers), or a list of languages.
  :ensure_installed ["toml" "rust" "org" "fennel"]
  ;; List of parsers to ignore installing.
  :ignore_install []
  ;; Extensions to set up.
  :highlight {
    :enable true
    ;; List of language that will be disabled.
    :disable []
    :additional_vim_regex_highlighting ["org"]}})

; TODO: Find a way to enable this only to the languages I need.
; (set nvim.o.foldmethod "expr")
; (set nvim.o.foldexpr "nvim_treesitter#foldexpr()")
