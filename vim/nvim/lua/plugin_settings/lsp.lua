local lsp_installer = require "nvim-lsp-installer"
local lsp_config = require "lspconfig"
local util = require "lspconfig/util"

lsp_installer.setup {
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
}

-- Customize the options passed to the server.
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp_config.sumneko_lua.setup {
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

lsp_config["rust_analyzer"].setup {
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
}

lsp_config.efm.setup {
  init_options = { documentFormatting = true },
  filetypes = { "lua" },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      lua = {
        {
          formatCommand = "~/Apps/stylua --config-path=$HOME/.config/stylua/stylua.toml -",
          formatStdin = true,
        },
      },
    },
  },
}

lsp_config.gopls.setup {
  cmd = { "gopls", "serve" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = { analyses = { unusedparams = true }, staticcheck = true },
  },
}
