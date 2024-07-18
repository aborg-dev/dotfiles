; Enable Rust code commands.
(local rt (require :rust-tools))
(local wk (require :which-key))

(rt.setup {:tools {:autoSetHints true}
           :server {:settings {:rust-analyzer {:assist {:importGranularity :module
                                                        :importPrefix :by_self}
                                               :cargo {:loadOutDirsFromCheck true}
                                               :procMacro {:enable true}
                                               :checkOnSave {:enable false}
                                               :rust {:analyzerTargetDir true}}}}
           :dap {:adapter {:type :executable
                           :command :lldb-vscode
                           :name :rt_lldb}}})

(vim.api.nvim_set_keymap :n :<localleader>ef ":RustRun<CR>"
                         {:noremap true :silent true})

(fn group [keys desc]
  {1 keys :group desc})

(fn bind [keys cmd desc]
  {1 keys 2 cmd : desc})

;; Project commands.
(wk.add [(group :<leader>p :+project)
         (bind :<leader>pr ":20split term://cargo run<CR>" "run main")
         (bind :<leader>pt ":20split term://cargo test<CR>" "run all tests")
         (bind :<leader>pc ":RustOpenCargo<CR>" "open cargo")
         (bind :<leader>pd ":RustOpenExternalDocs<CR>" "open symbol docs")])

