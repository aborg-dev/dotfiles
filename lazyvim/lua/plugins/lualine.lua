return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      -- Disable sections and component separators
      component_separators = "",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_b = {},
      lualine_z = {},
    },
  },
}
