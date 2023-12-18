-- [nfnl] Compiled from fnl/plugins/toggleterm_config.fnl by https://github.com/Olical/nfnl, do not edit.
local tt = require("toggleterm")
return tt.setup({open_mapping = "<C-t>", terminal_mappings = true, direction = "float", float_opts = {border = "curved"}})
