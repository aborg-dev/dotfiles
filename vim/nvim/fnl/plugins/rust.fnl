; Enable Rust code commands.
(module rust
  {autoload {nvim aniseed.nvim}
   autoload {wk which-key}
   autoload {rt rust-tools}})

(rt.setup {
  :tools {
    :autoSetHints true
  }
  :server {
		:settings {
			:rust-analyzer {
				:assist {
					:importGranularity "module"
					:importPrefix "by_self"
				}
				:cargo {
					:loadOutDirsFromCheck true
				}
				:procMacro {
					:enable true
				}
			}
		}
  }
})

(nvim.set_keymap :n :<localleader>ef ":RustRun<CR>" {:noremap true :silent true})

(wk.register
  ;; Project commands.
  {:p {:name "+project"
       :r [":Cargo run<CR>" "run main"]
       :t [":Cargo test<CR>" "run all tests"]}
   :c {:name "+code"
       :f [":RustFmt<CR>" "format code in a buffer"]}}
  {:prefix "<leader>"})
