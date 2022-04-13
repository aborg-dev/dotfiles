-- Always show completion/doc menu and ask the user to select it manually.
vim.o.completeopt = "menuone,noselect"

-- TODO: Review and document all of the options.
require("compe").setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,

  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
    ultisnips = true,
  },
}

-- Code navigation shortcuts.
-- as found in :help lsp
vim.api.nvim_set_keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<c-k>",
  "<cmd>lua vim.lsp.buf.signature_help()<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>cf",
  "<cmd>lua vim.lsp.buf.formatting()<CR>",
  { noremap = true }
)

-- Use LSP as the handler for formatexpr.
--    See `:help formatexpr` for more information.
vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
