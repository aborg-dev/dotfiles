-- [nfnl] Compiled from fnl/pyrepl.fnl by https://github.com/Olical/nfnl, do not edit.
local wk = require("which-key")
local function init()
  vim.api.nvim_set_keymap("n", "<localleader>ef", ":!python3 %<CR>", {noremap = true, silent = true})
  return wk.register({p = {name = "+project", r = {":!poetry run python main.py<CR>", "run main"}, t = {":!poetry run pytest<CR>", "run all tests"}}, c = {name = "+code", f = {":!poetry run black %<CR>:e<CR>", "format code in a buffer"}}}, {prefix = "<leader>"})
end
return init
