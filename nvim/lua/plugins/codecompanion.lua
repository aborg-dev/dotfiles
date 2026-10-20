local anthropic_api_key = os.getenv("ANTHROPIC_API_KEY")

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = true,
  opts = {
    ---@return string
    system_prompt = function()
      return "You are helping me with my codebase"
    end,
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = anthropic_api_key,
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "anthropic",
        slash_commands = {
          ["file"] = {
            opts = {
              -- ref: https://github.com/olimorris/codecompanion.nvim/discussions/276
              provider = "telescope",
            },
          },
        },
      },
      inline = {
        adapter = "anthropic",
      },
    },
    display = {
      action_palette = {
        provider = "default",
      },
      chat = {
        window = {
          layout = "vertical",
        },
        intro_message = "Start The Chat! Press ? for options",
        show_settings = true,
      },
    },
  },
  keys = {
    { "<leader>aj", mode = { "n" }, "<cmd>CodeCompanionChat Toggle<cr>", desc = "Open a new chat buffer" },
    { "<leader>ap", mode = { "n", "x" }, "<cmd>CodeCompanionActions<cr>" },
    {
      "<leader>aj",
      mode = { "x" },
      "<cmd>CodeCompanionChat Add<cr>",
      desc = "Paste the selected into the latest AI Chat",
    },
    {
      "<leader>ad",
      function()
        local code = require("codecompanion")
        local chat = code.last_chat()

        if chat then
          chat.close(chat)
        end
      end,
      mode = { "n" },
      desc = "Close the last chat buffer",
    },
  },
}
