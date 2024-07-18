-- [nfnl] Compiled from fnl/plugins/rust.fnl by https://github.com/Olical/nfnl, do not edit.
local rt = require("rust-tools")
local wk = require("which-key")
local h = require("helpers")
rt.setup({tools = {autoSetHints = true}, server = {settings = {["rust-analyzer"] = {assist = {importGranularity = "module", importPrefix = "by_self"}, cargo = {loadOutDirsFromCheck = true}, procMacro = {enable = true}, checkOnSave = {enable = false}, rust = {analyzerTargetDir = true}}}}, dap = {adapter = {type = "executable", command = "lldb-vscode", name = "rt_lldb"}}})
return wk.add(h.bind("<leader>p", "+project", {r = {":20split term://cargo run<CR>", "run main"}, t = {":20split term://cargo test<CR>", "run all tests"}, c = {":RustOpenCargo<CR>", "open cargo"}, d = {":RustOpenExternalDocs<CR>", "open symbol docs"}}))
