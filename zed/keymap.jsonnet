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
      [local_leader + ' w']: 'workspace::Save',
    }),

    ctx.vim_normal(map.hydra(leader, {
      '/': 'workspace::NewSearch',
      ',': 'tab_switcher::Toggle',
      'c f': 'editor::Format',
    })),

    // Search commands.
    ctx.vim_normal(map.hydra(leader + ' s', {
      w: 'workspace::NewSearch',
      // Symbols in a buffer.
      s: 'outline::Toggle',
      S: 'project_symbols::Toggle',
      r: 'editor::FindAllReferences',
    })),

    // Project commands.
    ctx.vim_normal(map.hydra(leader + ' p', {
      o: 'projects::OpenRecent',
      r: 'projects::OpenRemote',
    })),

    // Task commands.
    ctx.vim_normal(map.hydra(leader + ' t', {
      s: 'task::Spawn',
      r: 'task::Rerun',
    })),

    // Settings that can be toggled.
    ctx.vim_normal(map.hydra(leader + ' u', {
      w: 'editor::ToggleSoftWrap',
      h: 'editor::ToggleInlayHints',
    })),
  ],
])
