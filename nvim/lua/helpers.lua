-- [nfnl] Compiled from fnl/helpers.fnl by https://github.com/Olical/nfnl, do not edit.
local function group(keys, desc)
  return {keys, group = desc}
end
local function bind(keys, cmd, desc, _3fmode)
  return {keys, cmd, desc = desc, mode = (_3fmode or "n")}
end
local function bind_group(prefix, group_name, bindings)
  local function _1_()
    local tbl_17_auto = {}
    local i_18_auto = #tbl_17_auto
    for key, binding in pairs(bindings) do
      local val_19_auto = bind((prefix .. key), binding[1], binding[2], binding[3])
      if (nil ~= val_19_auto) then
        i_18_auto = (i_18_auto + 1)
        do end (tbl_17_auto)[i_18_auto] = val_19_auto
      else
      end
    end
    return tbl_17_auto
  end
  return {group(prefix, group_name), _1_()}
end
return {bind = bind_group}
