-- [nfnl] Compiled from fnl/plugins/spectre_config.fnl by https://github.com/Olical/nfnl, do not edit.
local wk = require("which-key")
local spectre = require("spectre")
local h = require("helpers")
spectre.setup({})
return wk.add(h.bind("<leader>r", "+replace", {r = {"<cmd>lua require('spectre').toggle()<CR>", "toggle"}, w = {"<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "word"}, v = {"<cmd>lua require('spectre').open_visual()<CR>", "visual"}, p = {"<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", "path"}}))
