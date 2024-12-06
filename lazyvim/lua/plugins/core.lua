return {
  -- Configure LazyVim to load Catpuccin colorscheme.
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
  -- Disable the text completion.
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = vim.tbl_filter(function(source)
        return not vim.tbl_contains({ "buffer", "nvim_lsp" }, source.name)
      end, opts.sources)
      table.insert(opts.sources, 1, {
        name = "nvim_lsp",
        entry_filter = function(entry, _)
          return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
        end,
      })
    end,
  },
}
