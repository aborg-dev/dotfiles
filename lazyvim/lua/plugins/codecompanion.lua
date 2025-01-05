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
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          schema = {
            model = {
              default = "gemini-1.5-pro-latest",
            },
          },
          env = {
            api_key = os.getenv("GEMINI_API_KEY"),
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
      agent = {
        adapter = "gemini",
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
