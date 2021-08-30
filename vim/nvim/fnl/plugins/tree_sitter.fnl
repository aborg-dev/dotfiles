(module tree_sitter
  {autoload {tree_sitter_config nvim-treesitter.configs}
   autoload {nvim aniseed.nvim}
   autoload {nvim_treesitter nvim-treesitter}})

(tree_sitter_config.setup {
  ;; One of "all", "maintained" (parsers with maintainers), or a list of languages.
  :ensure_installed ["toml" "rust"]
  ;; List of parsers to ignore installing.
  :ignore_install []
  ;; Extensions to set up.
  :highlight {
    :enable true
    ;; List of language that will be disabled.
    :disable []
    }})


(set nvim.o.foldmethod "expr")
(set nvim.o.foldexpr "nvim_treesitter#foldexpr()")
