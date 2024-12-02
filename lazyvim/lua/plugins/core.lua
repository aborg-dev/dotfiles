return {
  -- Configure LazyVim to load Catpuccin colorscheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
  -- Enable bufferline only for tabs.
  { "akinsho/bufferline.nvim", opts = { options = { mode = "tabs" } } },
}
