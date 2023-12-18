-- [nfnl] Compiled from fnl/plugins/tree_sitter.fnl by https://github.com/Olical/nfnl, do not edit.
local ts = require("nvim-treesitter.configs")
return ts.setup({ensure_installed = {"toml", "rust", "org", "fennel", "lua"}, ignore_install = {}, highlight = {enable = true, additional_vim_regex_highlighting = {"org"}}})
