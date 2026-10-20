return {
  "bullets-vim/bullets.vim",
  init = function()
    vim.g.bullets_set_mappings = 0
  end,
  keys = {
    { "<localleader>t", "<cmd>ToggleCheckbox<cr>", desc = "Toggle checkbox" },
    { "<C-CR>", "<cmd>InsertNewBullet<cr>", desc = "Insert new bullet", mode = { "n", "i" } },
  },
}
