-- [nfnl] Compiled from fnl/plugins/octo_config.fnl by https://github.com/Olical/nfnl, do not edit.
module(diary, {[autoload] = {[wk] = __fnl_global__which_2dkey}, [autoload] = {[octo] = octo}})
octo.setup({})
return wk.register({g = {name = "+github", i = {":Octo issue list<CR>", "issues"}, p = {":Octo pr list<CR>", "pull requests"}, a = {":Octo actions<CR>", "find action"}}}, {prefix = "<leader>"})
