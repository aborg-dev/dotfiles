return {
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "markdown" }, vim.bo.filetype) and vim.bo.buftype ~= "prompt"
    end,
    keymap = {
      preset = "super-tab",
    },
    sources = {
      default = { "codecompanion" },
      providers = {
        codecompanion = {
          name = "CodeCompanion",
          module = "codecompanion.providers.completion.blink",
          enabled = true,
        },
      },
    },
  },
}
