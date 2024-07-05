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

-- Use lua-based file detection. In the future we would be able to remove it.
vim.g["do_filetype_lua"] = 1

-- Disable Python style overrides (e.g. tabwidth=4).
vim.g.python_recommended_style = 0
