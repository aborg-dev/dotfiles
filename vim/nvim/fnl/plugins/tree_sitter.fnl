(module tree_sitter
  {autoload {tree_sitter_config nvim-treesitter.configs}})

(tree_sitter_config.setup {
  ;; One of "all", "maintained" (parsers with maintainers), or a list of languages.
  :ensure_installed ["toml"]
  ;; List of parsers to ignore installing.
  :ignore_install []
  ;; Extensions to set up.
  :highlight {
    :enable true
    ;; List of language that will be disabled.
    :disable []
    }})
