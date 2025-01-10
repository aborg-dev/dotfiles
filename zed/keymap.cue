#action: string | [...string]

#mapping: {
	context: string | *""
	bindings: [string]: #action
}

#keymap: [string]: #mapping

#keymap: {
	workspace: {
		context: "Editor && VimControl && !VimWaiting && !menu"
		bindings: {
			"space ,": "tab_switcher::Toggle"
			"space e": "workspace::ToggleLeftDock"
			"space /": "workspace::NewSearch"
			"n":       "search::SelectNextMatch"
			"shift-n": "search::SelectPrevMatch"
			", q":     "pane::CloseActiveItem"
		}
	}
	insert: {
		context: "Editor && vim_mode == insert"
		bindings: {
			"k j": ["workspace::SendKeystrokes", "escape"]
		}
	}
}

#keymap: {
	pane_movement: {
		context: "Dock || Terminal || Editor"
		bindings: {
			"ctrl-h": ["workspace::ActivatePaneInDirection", "Left"]
			"ctrl-l": ["workspace::ActivatePaneInDirection", "Right"]
			"ctrl-k": ["workspace::ActivatePaneInDirection", "Up"]
			"ctrl-j": ["workspace::ActivatePaneInDirection", "Down"]
			"ctrl-tab":       "pane::ActivateNextItem"
			"ctrl-shift-tab": "pane::ActivatePrevItem"
		}
	}
}

[
	for _, value in #keymap {
		context:  value.context
		bindings: value.bindings
	},
]
