local lsp_installer = require "nvim-lsp-installer"

-- Include the servers you want to have installed by default below.
local servers = {
  "rust_analyzer",
  "pyright",
	"sumneko_lua",
	"efm",
}

-- Install the missing servers.
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
	local opts = {}

	-- Customize the options passed to the server.
	if server.name == "sumneko_lua" then
		local runtime_path = vim.split(package.path, ';')
		table.insert(runtime_path, "lua/?.lua")
		table.insert(runtime_path, "lua/?/init.lua")

		opts.settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim).
					version = 'LuaJIT',
					-- Setup your lua path.
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global.
					globals = {'vim', 'use_rocks'},
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
		}
	elseif server.name == "rust_analyzer" then
		opts.settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true
        },
        procMacro = {
          enable = true
        },
      }
    }
	elseif server.name == "efm" then
		-- TODO: Find a way to derive this path from packer automatically or install the format
		-- tool through some other package manager on all systems.
		local luaformat = "~/.cache/nvim/packer_hererocks/2.1.0-beta3/bin/lua-format"

		opts.init_options = {documentFormatting = true}
		opts.filetypes = {"lua"}
		opts.settings = {
			rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = luaformat .. " -i" ..
										" --column-limit=100" ..
										" --indent-width=2" ..
										" --tab-width=2" ..
										" --double-quote-to-single-quote",
                    formatStdin = true
                }
            }
        }
		}
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

-- Enable type inlay hints.
vim.api.nvim_command([[
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require('lsp_extensions').inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
]])
