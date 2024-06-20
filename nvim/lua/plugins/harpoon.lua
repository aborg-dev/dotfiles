-- [nfnl] Compiled from fnl/plugins/harpoon.fnl by https://github.com/Olical/nfnl, do not edit.
local wk = require("which-key")
local harpoon = require("harpoon")
harpoon:setup({})
local function harpoon_list()
  return harpoon:list()("add")
end
wk.register({l = {name = "+harpoon", a = {":lua require('harpoon'):list():add()<CR>", "Add"}, f = {":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>", "List"}}}, {prefix = "<leader>"})
return wk.register({["<C-S-P>"] = {":lua require('harpoon'):list():prev()<CR>", "prev"}, ["<C-S-N>"] = {":lua require('harpoon'):list():next()<CR>", "next"}})
