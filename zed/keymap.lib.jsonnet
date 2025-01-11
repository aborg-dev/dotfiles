local lib = {
  // Succinct way to define bindings within a context.
  bind_with_context(context):: function(bindings) { context: context, bindings: bindings },
};

{
  // Available contexts for key bindings with their condition expressions.
  ctx: {
    // Core navigation and window management available across all interfaces and vim normal mode.
    hub:: lib.bind_with_context('Dock || Terminal || VimControl'),
    // Vim insert mode in text editor.
    vim_insert:: lib.bind_with_context('Editor && vim_mode == insert'),
    // Vim normal mode, excluding special states like waiting for input or menus.
    vim_normal:: lib.bind_with_context('Editor && VimControl && !VimWaiting && !menu'),
  },

  map: {
    // Helper for grouped key bindings with common prefix.
    hydra(prefix, bindings):: {
      [prefix + ' ' + key]: value
      for key in std.objectFields(bindings)
      for value in [bindings[key]]
    },
  },
}
