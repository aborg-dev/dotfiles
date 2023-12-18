-- [nfnl] Compiled from fnl/plugins/tree_sitter.fnl by https://github.com/Olical/nfnl, do not edit.
module(tree_sitter, {[autoload] = {[tree_sitter_configs] = __fnl_global__nvim_2dtreesitter.configs}, [autoload] = {[tree_sitter_parsers] = __fnl_global__nvim_2dtreesitter.parsers}, [autoload] = {[nvim_treesitter] = __fnl_global__nvim_2dtreesitter}})
return tree_sitter_configs.setup({ensure_installed = {"toml", "rust", "org"}, ignore_install = {}, highlight = {enable = true, disable = {}, additional_vim_regex_highlighting = {"org"}}})
