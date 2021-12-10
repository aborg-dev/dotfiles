; Dummy module to load all other aniseed modules.
(module startup
  {require {plugins plugins}
   require {settings settings}
   require {keymap keymap}
   require {pyrepl pyrepl}
   require {diary diary}})
