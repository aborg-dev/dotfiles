return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader><space>",
      function()
        require("telescope.builtin").find_files({ root = false })
      end,
      desc = "Find Files (cwd)",
    },
  },
}
