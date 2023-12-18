-- [nfnl] Compiled from fnl/plugins/orgmode_config.fnl by https://github.com/Olical/nfnl, do not edit.
module(orgmode_config, {[autoload] = {[wk] = __fnl_global__which_2dkey}, [autoload] = {[orgmode] = orgmode}})
orgmode.setup_ts_grammar()
orgmode.setup({org_indent_mode = "noindent", org_default_notes_file = "~/notes/inbox.org", org_agenda_files = {"~/notes/inbox.org", "~/notes/mobile_inbox.org", "~/notes/week.org"}})
nvim.ex.augroup("auFileTypes")
nvim.ex.autocmd_()
nvim.ex.autocmd("FileType", "org", "setlocal textwidth=100")
return nvim.ex.augroup("END")
