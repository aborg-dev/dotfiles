-- [nfnl] Compiled from fnl/plugins/tree_sitter.fnl by https://github.com/Olical/nfnl, do not edit.
local tree_sitter_configs = require("nvim-treesitter.configs")
require("nvim-treesitter.parsers")
return tree_sitter_configs.setup({ensure_installed = {"toml", "rust", "org", "fennel"}, ignore_install = {}, highlight = {enable = true, disable = {}, additional_vim_regex_highlighting = {"org"}}})
