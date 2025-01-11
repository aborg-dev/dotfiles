local lib = import 'keymap.lib.jsonnet';

function(prefix='g') [
  {
    context: 'VimControl && !menu',
    bindings: lib.map.hydra(
      prefix, {
        g: 'vim::StartOfDocument',
        h: 'editor::Hover',

        // Pane cycling.
        t: 'pane::ActivateNextItem',
        'shift-t': 'pane::ActivatePrevItem',

        // Code navigation.
        d: 'editor::GoToDefinition',
        'shift-d': 'editor::GoToDeclaration',
        y: 'editor::GoToTypeDefinition',
        'shift-i': 'editor::GoToImplementation',

        x: 'editor::OpenUrl',
        f: 'editor::OpenFile',

        // Search and selection.
        n: 'vim::SelectNextMatch',
        'shift-n': 'vim::SelectPreviousMatch',
        l: 'vim::SelectNext',
        'shift-l': 'vim::SelectPrevious',
        '>': ['editor::SelectNext', { replace_newest: true }],
        '<': ['editor::SelectPrevious', { replace_newest: true }],
        a: 'editor::SelectAllMatches',

        s: 'outline::Toggle',
        'shift-s': 'project_symbols::Toggle',
        '.': 'editor::ToggleCodeActions',  // zed specific
        'shift-a': 'editor::FindAllReferences',  // zed specific
        space: 'editor::OpenExcerpts',  // zed specific

        // Search word.
        '*': ['vim::MoveToNext', { partialWord: true }],
        '#': ['vim::MoveToPrev', { partialWord: true }],

        // Line navigation.
        j: ['vim::Down', { displayLines: true }],
        down: ['vim::Down', { displayLines: true }],
        k: ['vim::Up', { displayLines: true }],
        up: ['vim::Up', { displayLines: true }],
        '$': ['vim::EndOfLine', { displayLines: true }],
        end: ['vim::EndOfLine', { displayLines: true }],
        '0': ['vim::StartOfLine', { displayLines: true }],
        home: ['vim::StartOfLine', { displayLines: true }],
        '^': ['vim::FirstNonWhitespace', { displayLines: true }],

        v: 'vim::RestoreVisualSelection',
        ']': 'editor::GoToDiagnostic',
        '[': 'editor::GoToPrevDiagnostic',
        i: 'vim::InsertAtPrevious',
        ',': 'vim::ChangeListNewer',
        ';': 'vim::ChangeListOlder',
      },
    ),
  },
]
