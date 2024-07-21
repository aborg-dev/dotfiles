-- [nfnl] Compiled from fnl/plugins/spectre_config.fnl by https://github.com/Olical/nfnl, do not edit.
local wk = require("which-key")
local spectre = require("spectre")
local h = require("helpers")
spectre.setup({})
local function replace_word()
  return spectre.open_visual({select_word = true})
end
local function replace_in_file()
  return spectre.open_file_search({select_word = true})
end
return wk.add(h.bind("<leader>r", "+replace", {r = {spectre.toggle, "Replace"}, w = {replace_word, "Replace word"}, p = {replace_in_file, "Replace in file"}}))
