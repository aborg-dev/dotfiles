(module toggleterm_config
   {autoload {tt toggleterm}})

(tt.setup {
  :open_mapping :<C-t>
  :terminal_mappings true ;; Apply mappings in the opened terminals.
  ;; :insert_mappings false ;; I don't need mappings in insert mode.
  :direction "float"
	:float_opts {
		:border "curved"
	}})
