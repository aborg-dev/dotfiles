-- [nfnl] Compiled from fnl/plugins/orgmode_config.fnl by https://github.com/Olical/nfnl, do not edit.
local orgmode = require("orgmode")
return orgmode.setup({org_startup_indented = true, org_default_notes_file = "~/notes/inbox.org", org_agenda_files = {"~/notes/inbox.org", "~/notes/mobile_inbox.org", "~/notes/week.org"}})
