-- [nfnl] Compiled from fnl/pyrepl.fnl by https://github.com/Olical/nfnl, do not edit.
defn(init, {}, nvim.set_keymap("n", "<localleader>ef", ":!python3 %<CR>", {noremap = true, silent = true}), wk.register({p = {name = "+project", r = {":!poetry run python main.py<CR>", "run main"}, t = {":!poetry run pytest<CR>", "run all tests"}}, c = {name = "+code", f = {":!poetry run black %<CR>:e<CR>", "format code in a buffer"}}}, {prefix = "<leader>"}))
nvim.ex.augroup("pyrepl")
nvim.ex.autocmd_()
nvim.ex.autocmd("FileType", "python", "lua require('pyrepl').init()")
return nvim.ex.augroup("END")
