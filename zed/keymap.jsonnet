local lib = import 'keymap.lib.jsonnet';
local ctx = lib.ctx;
local map = lib.map;

local leader = 'space';
local local_leader = ',';

std.flattenArrays([
  (import 'window.lib.jsonnet')(prefix='space w'),
  (import 'actions.lib.jsonnet')(prefix='g'),
  [
    {
      context: 'Workspace',
      bindings: {
        'shift-ctrl-r': ['task::Spawn', { task_name: 'Update keymap' }],
      },
    },

    {
      context: 'ProjectSearchBar',
      bindings: {
        escape: 'pane::CloseActiveItem',
      },
    },

    ctx.hub({
      'ctrl-t': 'workspace::ToggleBottomDock',
      'ctrl-e': 'workspace::ToggleLeftDock',
      'ctrl-y': 'workspace::ToggleRightDock',
      'ctrl-h': ['workspace::ActivatePaneInDirection', 'Left'],
      'ctrl-l': ['workspace::ActivatePaneInDirection', 'Right'],
      'ctrl-k': ['workspace::ActivatePaneInDirection', 'Up'],
      'ctrl-j': ['workspace::ActivatePaneInDirection', 'Down'],
      'ctrl-tab': 'pane::ActivateNextItem',
      'ctrl-shift-tab': 'pane::ActivatePrevItem',
    }),

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
      ',': 'tab_switcher::Toggle',
    })),
  ],
])
