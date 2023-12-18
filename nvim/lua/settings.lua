-- [nfnl] Compiled from fnl/settings.fnl by https://github.com/Olical/nfnl, do not edit.
local function set_options(modes, name, value)
  for _, mode in ipairs(modes) do
    local mode_options = vim[mode]
    mode_options[name] = value
  end
  return nil
end
do
  local indent = 2
  set_options({"o", "bo"}, "tabstop", indent)
  set_options({"o", "bo"}, "shiftwidth", indent)
end
set_options({"o"}, "splitright", true)
set_options({"o"}, "splitbelow", true)
vim.g.expandtab = true
vim.wo.number = true
vim.wo.colorcolumn = "100"
return set_options({"o", "bo"}, "textwidth", 100)
