(module dap_config
  {autoload {wk which-key}
   autoload {dapui dapui}
   autoload {dap dap}})

(dapui.setup)

(wk.register
  ;; Debug commands.
  {:d {:name "+debug"
       :b [":lua require'dap'.toggle_breakpoint()<CR>" "toggle breakpoint"]
       :l [":lua require'dap'.run_last()<CR>" "run last"]
       :s [":lua require'dap'.step_over()<CR>" "step over"]
       :c [":lua require'dap'.continue()<CR>" "continue"]
       :u [":lua require'dapui'.toggle()<CR>" "toggle UI"]
       :e [":lua require'dapui'.eval()<CR>" "evaluate word"]}}
  {:prefix "<leader>"})
