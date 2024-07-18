-- [nfnl] Compiled from fnl/plugins/rust.fnl by https://github.com/Olical/nfnl, do not edit.
local rt = require("rust-tools")
local wk = require("which-key")
rt.setup({tools = {autoSetHints = true}, server = {settings = {["rust-analyzer"] = {assist = {importGranularity = "module", importPrefix = "by_self"}, cargo = {loadOutDirsFromCheck = true}, procMacro = {enable = true}, checkOnSave = {enable = false}, rust = {analyzerTargetDir = true}}}}, dap = {adapter = {type = "executable", command = "lldb-vscode", name = "rt_lldb"}}})
vim.api.nvim_set_keymap("n", "<localleader>ef", ":RustRun<CR>", {noremap = true, silent = true})
return wk.add({{"<leader>p", group = "+project"}, {"<leader>pr", ":20split term://cargo run<CR>", desc = "run main"}, {"<leader>pt", ":20split term://cargo test<CR>", desc = "run all tests"}, {"<leader>pc", ":RustOpenCargo<CR>", desc = "open cargo"}, {"<leader>pd", ":RustOpenExternalDocs<CR>", desc = "open symbol docs"}})
