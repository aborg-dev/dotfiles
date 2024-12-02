return {
  "folke/flash.nvim",
  keys = {
    {
      "L",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { mode = "search", max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = "^",
        })
      end,
      desc = "Flash line",
    },
  },
}
