local lib = import 'keymap.lib.jsonnet';
local ctx = lib.ctx;
local map = lib.map;

local leader = 'space';
local local_leader = ',';

[
  ctx.hub({
    'ctrl-t': 'workspace::ToggleBottomDock',
    'ctrl-h': ['workspace::ActivatePaneInDirection', 'Left'],
    'ctrl-l': ['workspace::ActivatePaneInDirection', 'Right'],
    'ctrl-k': ['workspace::ActivatePaneInDirection', 'Up'],
    'ctrl-j': ['workspace::ActivatePaneInDirection', 'Down'],
    'ctrl-tab': 'pane::ActivateNextItem',
    'ctrl-shift-tab': 'pane::ActivatePrevItem',
  }),

  ctx.hub(map.hydra(leader, {
    e: 'workpace::ToggleLeftDock',
    ',': 'tab_switcher::Toggle',
  })),

  ctx.vim_insert({
    'k j': ['workspace::SendKeystrokes', 'escape'],
  }),

  ctx.vim_normal({
    n: 'search::SelectNextMatch',
    'shift-n': 'search::SelectPrevMatch',
    [local_leader + ' q']: 'pane::CloseActiveItem',
  }),

  ctx.vim_normal(map.hydra(leader, {
    '/': 'workspace::NewSearch',
  })),
]
