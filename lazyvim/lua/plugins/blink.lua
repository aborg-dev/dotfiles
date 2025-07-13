return {
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "markdown", "rust" }, vim.bo.filetype) and vim.bo.buftype ~= "prompt"
    end,
    snippets = {
      expand = function() end, -- Disable snippet expansion
    },
  },
}
