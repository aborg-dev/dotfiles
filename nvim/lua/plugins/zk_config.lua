-- [nfnl] Compiled from fnl/plugins/zk_config.fnl by https://github.com/Olical/nfnl, do not edit.
module(zk_config, {[autoload] = {[wk] = __fnl_global__which_2dkey}, [autoload] = {[zk] = zk}})
__fnl_global__defn_2d(on_attach, {client, bufnr}, vim.api.nvim_exec_autocmds("User", {pattern = "LspAttached"}))
zk.setup({picker = "telescope", lsp = {config = {cmd = {"zk", "lsp"}, name = "zk", on_attach = on_attach}, auto_attach = {enabled = true, filetypes = {"markdown"}}}})
return wk.register({n = {name = "+notes", f = {":ZkNotes<CR>", "find note"}, t = {":ZkTags<CR>", "find note by tag"}, c = {":ZkNew { dir = 'roam', title = vim.fn.input('Title: ') }<CR>", "create note"}, d = {":ZkNew { dir = 'diary', date = 'now' }<CR>", "open weekly diary"}}}, {prefix = "<leader>"})
