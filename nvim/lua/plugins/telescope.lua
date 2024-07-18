-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local wk = require("which-key")
local actions = require("telescope.actions")
local telescope = require("telescope")
local h = require("helpers")
telescope.setup({defaults = {mappings = {i = {["<C-j>"] = actions.move_selection_next, ["<C-k>"] = actions.move_selection_previous}}}, pickers = {find_files = {theme = "ivy", layout_config = {height = 0.4}, previewer = false}, buffers = {theme = "ivy", show_all_buffers = true, layout_config = {height = 0.4}, previewer = false}}})
local function call(telescope_builtin_name)
  return (":lua require('telescope.builtin')." .. telescope_builtin_name .. "()<CR>")
end
wk.add(h.bind("<leader>", "+telescope", {[" "] = {call("find_files"), "find_files"}, [","] = {call("buffers"), "buffers"}}))
wk.add(h.bind("<leader>h", "+help", {b = {call("keymaps"), "key bindings"}, o = {call("vim_options"), "vim options"}, t = {call("help_tags"), "help tags"}}))
return wk.add(h.bind("<leader>s", "+search", {s = {call("live_grep"), "live_grep"}, w = {call("grep_string"), "grep_string"}, c = {call("command_history"), "command history"}, r = {call("lsp_references"), "symbol references"}, f = {call("lsp_dynamic_workspace_symbols"), "workspace symbols"}, d = {call("lsp_document_symbols"), "document symbols"}}))
