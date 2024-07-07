(local ts (require :nvim-treesitter.configs))

(ts.setup {
  ;; One of "all", "maintained" (parsers with maintainers), or a list of languages.
  :ensure_installed ["toml" "rust" "org" "fennel" "lua" "terraform" "markdown" "markdown_inline" "nix"]
  ;; List of parsers to ignore installing.
  :ignore_install []
  ;; Extensions to set up.
  :highlight {
    :enable true
    :additional_vim_regex_highlighting ["org"]}})

(set vim.o.foldmethod "expr")
(set vim.o.foldexpr "v:lua.vim.treesitter.foldexpr()")
(set vim.o.foldenable false)
(set vim.o.foldnestmax 3)
(set vim.o.foldlevelstart 1)
