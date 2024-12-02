return {
  "zk-org/zk-nvim",
  name = "zk",
  opts = {
    picker = "telescope",
    lsp = {
      config = { cmd = { "zk", "lsp" }, name = "zk" },
      auto_attach = { enabled = true, filetypes = { "markdown" } },
    },
  },
  keys = {
    { "<Leader>nf", "<cmd>ZkNotes { tags = { 'NOT weekly' }, sort = { 'modified' } }<cr>", desc = "Find note" },
    { "<Leader>nr", "<cmd>ZkNotes { tags = { 'weekly' }, sort = { 'created' } }<cr>", desc = "Find weekly note" },
    { "<Leader>nt", "<cmd>ZkTags<cr>", desc = "Find note by tag" },
    { "<Leader>nc", "<cmd>ZkNew { dir = 'roam', title = vim.fn.input('Title: ') }<cr>", desc = "Create note" },
    { "<Leader>nd", "<cmd>ZkNew { dir = 'diary', date = 'now' }<cr>", desc = "Open weekly diary" },
  },
}
