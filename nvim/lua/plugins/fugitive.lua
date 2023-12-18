-- [nfnl] Compiled from fnl/plugins/fugitive.fnl by https://github.com/Olical/nfnl, do not edit.
local wk = require("which-key")
return wk.register({g = {name = "+git", g = {":G<CR>", "Status"}, d = {":G diff<CR>", "Diff"}, l = {":G log<CR>", "Log"}, p = {":G push<CR>", "Push"}, a = {":G commit --amend<CR>", "Amend"}, c = {":G commit<CR>", "Commit"}}}, {prefix = "<leader>"})
