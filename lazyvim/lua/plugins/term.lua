return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = "<C-t>",
    -- Apply mappings in the opened terminals.
    terminal_mappings = true,
    shell = "~/.nix-profile/bin/fish",
    -- I don't need mappings in insert mode.
    insert_mappings = false,
    direction = "tab",
    shade_terminals = false,
  },
}
