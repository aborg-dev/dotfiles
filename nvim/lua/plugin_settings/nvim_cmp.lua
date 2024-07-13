local cmp = require "cmp"

-- Always show completion/doc menu and ask the user to select it manually.
vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
  sources = cmp.config.sources {
    -- Autocomplete file paths.
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "ultisnips", keyword_length = 2 },
    { name = "buffer",    keyword_length = 3 },
    { name = "copilot",   group_index = 2 },
  },
  -- formatting = {
  --   format = lspkind.cmp_format({
  --     mode = "symbol",
  --     max_width = 50,
  --     symbol_map = { Copilot = "" }
  --   })
  -- }
}
