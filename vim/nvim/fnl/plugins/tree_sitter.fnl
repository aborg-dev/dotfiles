(module tree_sitter
  {autoload {tree_sitter_configs nvim-treesitter.configs}
   autoload {tree_sitter_parsers nvim-treesitter.parsers}
   autoload {nvim aniseed.nvim}
   autoload {nvim_treesitter nvim-treesitter}})


(tset (tree_sitter_parsers.get_parser_configs)
  :org {
   :install_info {
    :url "https://github.com/milisims/tree-sitter-org"
    :revision "main"
    :files ["src/parser.c" "src/scanner.cc"]}
   :filetype "org"})

(tree_sitter_configs.setup {
  ;; One of "all", "maintained" (parsers with maintainers), or a list of languages.
  :ensure_installed ["toml" "rust" "org"]
  ;; List of parsers to ignore installing.
  :ignore_install []
  ;; Extensions to set up.
  :highlight {
    :enable true
    ;; List of language that will be disabled.
    :disable []
    :additional_vim_regex_highlighting ["org"]}})


(set nvim.o.foldmethod "expr")
(set nvim.o.foldexpr "nvim_treesitter#foldexpr()")
