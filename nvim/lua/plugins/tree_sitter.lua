-- [nfnl] Compiled from fnl/plugins/tree_sitter.fnl by https://github.com/Olical/nfnl, do not edit.
local ts = require("nvim-treesitter.configs")
ts.setup({ensure_installed = {"toml", "rust", "org", "fennel", "lua", "terraform", "markdown", "markdown_inline"}, ignore_install = {}, highlight = {enable = true, additional_vim_regex_highlighting = {"org"}}})
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldenable = false
vim.o.foldnestmax = 3
vim.o.foldlevelstart = 1
return nil
