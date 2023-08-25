local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local lsp_config = require "lspconfig"
local util = require "lspconfig/util"

local lsp_defaults = {
  -- Callback function that will be executed when a language server is attached to a buffer.
  on_attach = function(_, _)
    vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
  end,
}
-- And update default LSP config.
lsp_config.util.default_config = vim.tbl_deep_extend(
  "force",
  lsp_config.util.default_config,
  lsp_defaults
)

mason.setup {
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
}

mason_lspconfig.setup {
	ensure_installed = { "lua_ls" }
}

-- Customize the options passed to the server.
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp_config.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim).
        version = "LuaJIT",
        -- Setup your lua path.
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global.
        globals = { "vim", "use_rocks" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- lsp_config.efm.setup {
--   init_options = { documentFormatting = true },
--   filetypes = { "lua" },
--   settings = {
--     rootMarkers = { ".git/" },
--     languages = {
--       lua = {
--         {
--           formatCommand = "stylua --config-path=$HOME/.config/stylua/stylua.toml -",
--           formatStdin = true,
--         },
--       },
--     },
--   },
-- }

lsp_config.gopls.setup {
  cmd = { "gopls", "serve" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = { analyses = { unusedparams = true }, staticcheck = true },
  },
}

lsp_config.beancount.setup {
  init_options = {
    journal_file = "/home/akashin/Repos/finance/data/ledger.bean",
  },
}

lsp_config.pyright.setup {}

lsp_config.clangd.setup {}

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.bean" }, command = "setlocal foldmethod=marker" }
)

vim.api.nvim_create_autocmd("User", {
  pattern = "LspAttached",
  desc = "LSP actions",
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor.
    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

    -- Jump to the definition.
    bufmap("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<cr>")

    -- Lists all the implementations for the symbol under the cursor.
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

    -- Jumps to the definition of the type symbol.
    bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

    -- Displays a function's signature information
    bufmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

    -- Renames all references to the symbol under the cursor
    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>")

    -- Selects a code action available at the current cursor position
    bufmap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    bufmap("x", "ga", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

    -- Show diagnostics in a floating window
    bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

    -- Move to the previous diagnostic
    bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

    -- Move to the next diagnostic
    bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

    bufmap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<cr>")
  end,
})

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set updatetime=300
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
