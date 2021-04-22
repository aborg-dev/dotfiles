local actions = require('telescope.actions')

require('telescope').setup{
  -- This is global remapping across all pickers.
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}

require('whichkey_setup').register_keymap('leader', {
  -- 'show_all_buffers = true' is needed to also show hidden buffers.
  [","] = {':lua require("telescope.builtin").buffers({show_all_buffers = true})<CR>', 'buffers'},
  -- TODO: Why wouldn't it work after some delay???
  [" "] = {':lua require("telescope.builtin").find_files({previewer = false})<CR>', 'find_files'},
  -- [" "] = {':lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({ winblend = 10 }))<CR>', 'find_files'},

  h = {
    name = '+help',
    b = {':lua require("telescope.builtin").keymaps()<CR>', 'key bindings'},
    o = {':lua require("telescope.builtin").vim_options()<CR>', 'vim options'},
    t = {':lua require("telescope.builtin").help_tags()<CR>', 'help tags'},
  },

  s = {
    name = '+search',
    s = {':lua require("telescope.builtin").live_grep()<CR>', 'live_grep'},
    c = {':lua require("telescope.builtin").command_history()<CR>', 'command history'},
  }
})
