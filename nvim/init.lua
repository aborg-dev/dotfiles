local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("startup")

-- Visual settings.
-- TODO: Move to another file.
vim.cmd "colorscheme gruvbox"
vim.o.termguicolors = true

-- Use lua-based file detection. In the future we would be able to remove it.
vim.g["do_filetype_lua"] = 1

-- Enabling folding in Markdown files.
vim.g.markdown_folding = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
