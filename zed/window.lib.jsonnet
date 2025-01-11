local lib = import 'keymap.lib.jsonnet';

function(prefix='ctrl-w') [
  {
    context: 'ProjectPanel || CollabPanel || OutlinePanel || ChatPanel || VimControl || EmptyPane || SharedScreen || MarkdownPreview || KeyContextView',
    bindings:
      lib.map.hydra(
        prefix, {
          '': null,

          // Navigation.
          left: ['workspace::ActivatePaneInDirection', 'Left'],
          right: ['workspace::ActivatePaneInDirection', 'Right'],
          up: ['workspace::ActivatePaneInDirection', 'Up'],
          down: ['workspace::ActivatePaneInDirection', 'Down'],
          h: ['workspace::ActivatePaneInDirection', 'Left'],
          l: ['workspace::ActivatePaneInDirection', 'Right'],
          k: ['workspace::ActivatePaneInDirection', 'Up'],
          j: ['workspace::ActivatePaneInDirection', 'Down'],
          'ctrl-h': ['workspace::ActivatePaneInDirection', 'Left'],
          'ctrl-l': ['workspace::ActivatePaneInDirection', 'Right'],
          'ctrl-k': ['workspace::ActivatePaneInDirection', 'Up'],
          'ctrl-j': ['workspace::ActivatePaneInDirection', 'Down'],

          // Swapping.
          'shift-left': ['workspace::SwapPaneInDirection', 'Left'],
          'shift-right': ['workspace::SwapPaneInDirection', 'Right'],
          'shift-up': ['workspace::SwapPaneInDirection', 'Up'],
          'shift-down': ['workspace::SwapPaneInDirection', 'Down'],
          'shift-h': ['workspace::SwapPaneInDirection', 'Left'],
          'shift-l': ['workspace::SwapPaneInDirection', 'Right'],
          'shift-k': ['workspace::SwapPaneInDirection', 'Up'],
          'shift-j': ['workspace::SwapPaneInDirection', 'Down'],

          // Resizing.
          '>': ['vim::ResizePane', 'Widen'],
          '<': ['vim::ResizePane', 'Narrow'],
          '-': ['vim::ResizePane', 'Shorten'],
          '+': ['vim::ResizePane', 'Lengthen'],
          _: 'vim::MaximizePane',
          '=': 'vim::ResetPaneSizes',

          // Tab navigation.
          'g t': 'pane::ActivateNextItem',
          'ctrl-g t': 'pane::ActivateNextItem',
          'g shift-t': 'pane::ActivatePrevItem',
          'ctrl-g shift-t': 'pane::ActivatePrevItem',

          // Pane navigation.
          w: 'workspace::ActivateNextPane',
          'ctrl-w': 'workspace::ActivateNextPane',
          p: 'workspace::ActivatePreviousPane',
          'ctrl-p': 'workspace::ActivatePreviousPane',
          'shift-w': 'workspace::ActivatePreviousPane',
          'ctrl-shift-w': 'workspace::ActivatePreviousPane',

          // Split operations.
          v: 'pane::SplitVertical',
          'ctrl-v': 'pane::SplitVertical',
          s: 'pane::SplitHorizontal',
          'shift-s': 'pane::SplitHorizontal',
          'ctrl-s': 'pane::SplitHorizontal',

          // Closing.
          c: 'pane::CloseAllItems',
          'ctrl-c': 'pane::CloseAllItems',
          q: 'pane::CloseAllItems',
          'ctrl-q': 'pane::CloseAllItems',
          o: 'workspace::CloseInactiveTabsAndPanes',
          'ctrl-o': 'workspace::CloseInactiveTabsAndPanes',

          // New file.
          n: 'workspace::NewFileSplitHorizontal',
          'ctrl-n': 'workspace::NewFileSplitHorizontal',
        }
      ),
  },
]
