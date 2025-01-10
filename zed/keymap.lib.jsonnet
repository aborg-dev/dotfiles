{
  // Available contexts for key bindings with their condition expressions.
  ctx: {
    // Core navigation and window management available across all interfaces and vim normal mode.
    hub: '(Dock || Terminal || Editor && VimControl && !VimWaiting && !menu)',

    // Vim insert mode in text editor.
    vim_insert: 'Editor && vim_mode == insert',

    // Vim normal mode, excluding special states like waiting for input or menus.
    vim_normal: 'Editor && VimControl && !VimWaiting && !menu',
  },

  // Helper for grouped key bindings with common prefix.
  hydra(prefix, bindings):: {
    [prefix + ' ' + key]: value
    for key in std.objectFields(bindings)
    for value in [bindings[key]]
  },

  // Succinct way to define bindings within a context.
  bind_with_context(ctx):: function(bindings) { context: ctx, bindings: bindings },
  hub:: self.bind_with_context($.ctx.hub),
  vim_insert:: self.bind_with_context($.ctx.vim_insert),
  vim_normal:: self.bind_with_context($.ctx.vim_normal),
}
