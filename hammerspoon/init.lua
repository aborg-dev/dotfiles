local mash   = {"ctrl", "cmd"}

hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind(mash, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(mash, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)


hs.hotkey.bind(mash, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    local resutl
    if state then
        result = caffeine:setIcon("icons/on.pdf")
    else
        result = caffeine:setIcon("icons/off.pdf")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

local function timewarrior_process_output(task, stdOut, stdErr)
  tracking = string.match(stdOut, "Tracking \"?(%S+)")
  if tracking == nil then
    timewarrior_menu:setTitle("No tracking")
  else
    timewarrior_menu:setTitle(tracking)
    timewarrior_menu:setTooltip(stdOut)
    timewarrior_menu:setMenu({{ title = stdOut}})
  end
  return false
end

local function timewarrior_update_menu()
  timewarrior_task = hs.task.new("/usr/local/bin/timew", nil, timewarrior_process_output)
  timewarrior_task:start()
end

local function timewarrior_create_menu(timewarrior_origin)
  if timewarrior_menu == nil then
    timewarrior_menu = hs.menubar.new()
  end
end

local function timewarrior_enable()
  timewarrior_disable_count = 0;
  if (timewarrior_is_active) then
    return
  elseif timewarrior_timer == nil then
    timewarrior_create_menu()
    timewarrior_update_menu()
    timewarrior_timer = hs.timer.new(1, timewarrior_update_menu)
  end

  timewarrior_is_active = true
  timewarrior_timer:start()
end

--timewarrior_enable()

-- vim:shiftwidth=2
