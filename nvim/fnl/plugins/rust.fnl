; Enable Rust code commands.
(local rt (require :rust-tools))
(local wk (require :which-key))

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
				:checkOnSave {
					:enable false
				}
				:rust {
				  :analyzerTargetDir true
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

(vim.api.nvim_set_keymap :n :<localleader>ef ":RustRun<CR>" {:noremap true :silent true})

;; Project commands.
(wk.add [
   { 1 "<leader>p" :group "+project"}
   { 1 "<leader>pr" 2 ":20split term://cargo run<CR>" :desc "run main" }
   { 1 "<leader>pt" 2 ":20split term://cargo test<CR>" :desc "run all tests" }
   { 1 "<leader>pc" 2 ":RustOpenCargo<CR>"  :desc "open cargo" }
   { 1 "<leader>pd" 2 ":RustOpenExternalDocs<CR>" :desc "open symbol docs" }
])
