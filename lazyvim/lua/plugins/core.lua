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
  -- Disable inlay hints by default.
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
