local k = import 'keymap.lib.jsonnet';
local leader = 'space';
local local_leader = ',';

[
  k.hub({
    'ctrl-t': 'workspace::ToggleBottomDock',
    'ctrl-h': ['workspace::ActivatePaneInDirection', 'Left'],
    'ctrl-l': ['workspace::ActivatePaneInDirection', 'Right'],
    'ctrl-k': ['workspace::ActivatePaneInDirection', 'Up'],
    'ctrl-j': ['workspace::ActivatePaneInDirection', 'Down'],
    'ctrl-tab': 'pane::ActivateNextItem',
    'ctrl-shift-tab': 'pane::ActivatePrevItem',
  }),

  k.hub(k.hydra(leader, {
    e: 'workspace::ToggleLeftDock',
    ',': 'tab_switcher::Toggle',
  })),

  k.vim_insert({
    'k j': ['workspace::SendKeystrokes', 'escape'],
  }),

  k.vim_normal({
    n: 'search::SelectNextMatch',
    'shift-n': 'search::SelectPrevMatch',
    [local_leader + ' q']: 'pane::CloseActiveItem',
  }),

  k.vim_normal(k.hydra(leader, {
    '/': 'workspace::NewSearch',
  })),
]
