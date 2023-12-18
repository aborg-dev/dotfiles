-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local wk = require("which-key")
local actions = require("telescope.actions")
local telescope = require("telescope")
telescope.setup({defaults = {mappings = {i = {["<C-j>"] = actions.move_selection_next, ["<C-k>"] = actions.move_selection_previous}}}, pickers = {find_files = {theme = "ivy", layout_config = {height = 0.4}, previewer = false}, buffers = {theme = "ivy", show_all_buffers = true, layout_config = {height = 0.4}, previewer = false}}})
wk.register({[" "] = {":lua require('telescope.builtin').find_files()<CR>", "find_files"}, [","] = {":lua require('telescope.builtin').buffers()<CR>", "buffers"}}, {prefix = "<leader>"})
wk.register({h = {name = "+help", b = {":lua require('telescope.builtin').keymaps()<CR>", "key bindings"}, o = {":lua require('telescope.builtin').vim_options()<CR>", "vim options"}, t = {":lua require('telescope.builtin').help_tags()<CR>", "help tags"}}}, {prefix = "<leader>"})
return wk.register({s = {name = "+search", s = {":lua require('telescope.builtin').live_grep()<CR>", "live_grep"}, w = {":lua require('telescope.builtin').grep_string()<CR>", "grep_string"}, c = {":lua require('telescope.builtin').command_history()<CR>", "command history"}, r = {":lua require('telescope.builtin').lsp_references()<CR>", "symbol references"}, f = {":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", "workspace symbols"}, d = {":lua require('telescope.builtin').lsp_document_symbols()<CR>", "document symbols"}}}, {prefix = "<leader>"})
