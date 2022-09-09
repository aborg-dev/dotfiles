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
  :dap {
    :adapter {
      :type "executable"
      :command "lldb-vscode"
      :name "rt_lldb"
    }
  }
})

(nvim.set_keymap :n :<localleader>ef ":RustRun<CR>" {:noremap true :silent true})

(wk.register
  ;; Project commands.
  {:p {:name "+project"
       :r [":RustRunnables<CR>" "run main"]
       :t [":20split term://cargo test<CR>" "run all tests"]
       :c [":RustOpenCargo<CR>" "open cargo"]
       :d [":RustOpenExternalDocs<CR>" "open symbol docs"]}}
  {:prefix "<leader>"})
