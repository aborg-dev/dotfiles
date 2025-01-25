return {
  {
    "natecraddock/workspaces.nvim",
    opts = {
      hooks = {
        open_pre = {
          -- If recording, save current session state and stop recording
          "SessionsStop",

          -- delete all buffers (does not save changes)
          "silent %bdelete!",
        },
        open = function()
          require("sessions").load(nil, { silent = true })
        end,
      },
    },
    event = "VeryLazy",
    keys = {
      {
        "<Leader>fp",
        "<cmd>Telescope workspaces<CR>",
        desc = "open workspace",
      },
    },
  },
  {
    "natecraddock/sessions.nvim",
    event = "VeryLazy",
    opts = {
      session_filepath = vim.fn.stdpath("data") .. "/sessions",
      absolute = true,
    },
  },
}
