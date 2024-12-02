return {
  "alexghergh/nvim-tmux-navigation",
  event = "VeryLazy",
  keys = {
    { "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", desc = "Tmux go left" },
    { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", desc = "Tmux go right" },
    { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", desc = "Tmux go down" },
    { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", desc = "Tmux go up" },
  },
  opts = {},
}
