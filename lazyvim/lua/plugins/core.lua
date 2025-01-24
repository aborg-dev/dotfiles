return {
  -- Configure LazyVim to load Catpuccin colorscheme.
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      term_colors = true,
    },
  },
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
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      -- Disable the help string.
      opts.defaults.header = false
      -- Don't show hidden files by default.
      opts.files.fd_opts = [[--color=never --type f --follow --exclude .git --exclude .jj]]
    end,
  },
  {
    "julienvincent/hunk.nvim",
    cmd = { "DiffEditor" },
    config = function()
      require("hunk").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<Leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Repo diff" },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      patterns = { ".git", ".jj" },
      manual_mode = false,
    },
  },
}
