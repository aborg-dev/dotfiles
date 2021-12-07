-- Make some modules easier to access.
local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

-- Work out where our plugins will be stored.
local pack_path = fn.stdpath "data" .. "/site/pack"

local function ensure(user, repo)
  -- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
  local install_path = fmt("%s/packer/opt/%s", pack_path, repo, repo)
  local installed = false
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    installed = true
  end
  execute(fmt("packadd %s", repo))
  return installed
end

-- Packer is our plugin manager.
if ensure("wbthomason", "packer.nvim") then
  require "plugins"
  execute "PackerInstall"
end

-- This must be executed before loading aniseed to use the correct configuration.
vim.g["aniseed#env"] = {
  output = vim.fn.stdpath "config" .. "/lua/.compiled-lua",
  module = "startup",
}

-- Aniseed compiles our Fennel code to Lua and loads it automatically.
ensure("Olical", "aniseed")

-- Visual settings.
-- TODO: Move to another file.
vim.cmd "colorscheme gruvbox"
vim.o.termguicolors = true
