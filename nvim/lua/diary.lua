-- [nfnl] Compiled from fnl/diary.fnl by https://github.com/Olical/nfnl, do not edit.
module(diary, {[autoload] = {[nvim] = aniseed.nvim}, [autoload] = {[wk] = __fnl_global__which_2dkey}, [autoload] = {[ts_utils] = __fnl_global__nvim_2dtreesitter.ts_utils}})
local function _1_(...)
  local lines = nvim.buf_get_lines(0, 0, -1, true)
  local line_count = #lines
  local last_line_length = #lines[line_count]
  return nvim.win_set_cursor(0, {line_count, last_line_length})
end
__fnl_global__defn_2d(__fnl_global__go_2dto_2dlast_2dchar, {}, _1_(...))
__fnl_global__defn_2d(current_weekday, {}, os.date("%A"))
__fnl_global__defn_2d(current_time, {}, os.date("%H:%M"))
__fnl_global__defn_2d(create_day_section, {weekday}, nvim.paste(("\n* " .. weekday), true, -1))
local function _2_(...)
  local parser = vim.treesitter.get_parser(bufnr, "org")
  local tree = parser:parse()
  local first_tree = tree[1]
  local root = first_tree:root()
  return root
end
__fnl_global__defn_2d(get_parse_tree_root, {bufnr}, _2_(...))
local function _3_(...)
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for child in root:iter_children() do
    local val_19_auto
    if (child:type() == "section") then
      val_19_auto = child
    else
      val_19_auto = nil
    end
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  return tbl_17_auto
end
__fnl_global__defn_2d(get_top_level_sections, {root}, _3_(...))
local function _6_(...)
  local heading = section:named_child(0)
  local item = heading:named_child(1)
  local s_row, s_col, e_row, e_col = item:range()
  local text = nvim.buf_get_text(0, s_row, s_col, e_row, e_col, {})
  return text[1]
end
__fnl_global__defn_2d(get_section_title, {section}, _6_(...))
local function _9_(...)
  local headings
  do
    local tbl_17_auto = {}
    local i_18_auto = #tbl_17_auto
    for _, section in ipairs(get_top_level_sections(root)) do
      local val_19_auto
      if (get_section_title(section) == weekday) then
        val_19_auto = section
      else
        val_19_auto = nil
      end
      if (nil ~= val_19_auto) then
        i_18_auto = (i_18_auto + 1)
        do end (tbl_17_auto)[i_18_auto] = val_19_auto
      else
      end
    end
    headings = tbl_17_auto
  end
  local _10_ = #headings
  if (_10_ == 0) then
    return nil
  elseif (_10_ == 1) then
    return headings[1]
  elseif true then
    local _ = _10_
    return error("Found more than one heading")
  else
    return nil
  end
end
__fnl_global__defn_2d(find_weekday_heading, {root, weekday}, _9_(...))
local function _12_(...)
  local s_row, s_col, e_row, e_col = heading:range()
  local last_line = nvim.buf_get_lines(0, (e_row - 1), e_row, true)
  local last_line_length = #last_line[1]
  return nvim.win_set_cursor(0, {e_row, last_line_length})
end
__fnl_global__defn_2d(set_cursor_to_heading_end, {heading}, _12_(...))
local root = get_parse_tree_root(0)
local weekday = current_weekday()
local heading = find_weekday_heading(root, weekday)
local _13_
if (nil == heading) then
  __fnl_global__go_2dto_2dlast_2dchar()
  _13_ = create_day_section(weekday)
else
  _13_ = nil
end
local heading0 = find_weekday_heading(root, weekday)
defn(append_note, {}, "Append a note to the current file.", nil, nil, nil, _13_, nil, set_cursor_to_heading_end(heading0), nvim.paste(("\n" .. current_time()), true, -1))
local root0 = get_parse_tree_root(0)
local weekday0 = current_weekday()
local heading1 = find_weekday_heading(root0, weekday0)
defn(tail_node, {}, "Inspects the current node", nil, nil, nil, set_cursor_to_heading_end(heading1))
return wk.register({n = {name = "+notes", j = {":lua require('diary').append_note()<CR>", "append note"}, i = {":lua require('diary').tail_node()<CR>", "tail node"}}}, {prefix = "<leader>"})
