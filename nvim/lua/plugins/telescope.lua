return {
  {
    "nvim-telescope/telescope.nvim",
  },
  {
    "zschreur/telescope-jj.nvim",
    keys = {
      {
        "<Leader>jd",
        function()
          require("telescope").extensions.jj.diff()
        end,
        desc = "jj diff",
      },
    },
  },
}
