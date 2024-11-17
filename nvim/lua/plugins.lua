return require("lazy").setup({
  -- Visual plugins.
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto",
        background = {
          light = "latte",
          dark = "frappe",
        },
      })
      vim.o.termguicolors = true
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Tool for profiling vim startup time.
  -- Use :StartupTime to run it.
  "tweekmonster/startuptime.vim",

  -- Tool to set up keybindings and visually see them.
  -- Most of the plugins I use expose their shortcuts in a structured hierarchical
  -- manner using this plugin. The configuration is incrementally extended in
  -- the plugin-specific files.
  {
    "folke/which-key.nvim",
    config = function()
      require("plugins.which_key")
    end,
  },

  -- Tool for fuzzy search over lists.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "kyazdani42/nvim-web-devicons" },
    },
    config = function()
      require("plugins.telescope")
    end,
  },

  -- Vim git client.
  {
    "tpope/vim-fugitive",
    config = function()
      require("plugins.fugitive")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Lisp-y configuration.
  { "Olical/nfnl", ft = "fennel" },
  { "Olical/conjure", ft = "fennel" },

  -- Comment lines with 'gcc' and 'gc{motion}.
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
  },

  -- Add shortcuts to jump between vim and tmux splits.
  "christoomey/vim-tmux-navigator",

  -- Quickly jump to a place in visible buffers with s{a}{b}.
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
      { "L",     mode = { "n", "x", "o" }, function() require("flash").jump({
        search = { mode = "search", max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = "^"
      }) end,            desc = "Flash line" },
    },
  },

  -- Auto-completion plugin.
  {
    "hrsh7th/nvim-cmp",
    ft = { "lua", "python", "fennel", "cpp", "rust", "go", "markdown", "beancount", "javascript" },
    config = function()
      require("plugin_settings.nvim_cmp")
    end,
  },

  { "hrsh7th/cmp-nvim-lsp", dependencies = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lua", dependencies = "cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer", dependencies = "cmp-nvim-lua" },
  { "hrsh7th/cmp-path", dependencies = "cmp-buffer" },
  { "hrsh7th/cmp-calc", dependencies = "cmp-path" },
  { "hrsh7th/cmp-cmdline", dependencies = "cmp-calc" },

  -- Settings for commonly used LSP servers for different languages.
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("plugin_settings.lsp")
    end,
  },
  -- Used for inline type annotation in Rust.
  "nvim-lua/lsp_extensions.nvim",

  {
    "stevearc/conform.nvim",
    ft = { "lua", "python", "rust", "fennel", "nix" },
    opts = {},
    config = function()
      require("conform").setup({
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          rust = { "rustfmt" },
          fennel = { "fnlfmt" },
          nix = { "nixfmt" },
        },
      })
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      require("plugins.rust")
    end,
  },

  -- Engine for parsing snippets.
  "SirVer/ultisnips",

  -- Actual snippets for multiple programming languages.
  "honza/vim-snippets",

  {
    "nvim-treesitter/nvim-treesitter",
    dev = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugins.tree_sitter")
    end,
  },

  {
    "mickael-menu/zk-nvim",
    config = function()
      require("plugins.zk_config")
    end,
  },

  {
    "dkarter/bullets.vim",
    init = function()
      vim.g.bullets_set_mappings = 0
    end,
    config = function()
      require("plugins.bullets_config")
    end,
  },

  {
    "tummetott/unimpaired.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "tmux"
      -- Use the opposite split by default.
      vim.g.slime_default_config = {
        ["socket_name"] = vim.fn.get(vim.fn.split(vim.env.TMUX, ","), 0),
        ["target_pane"] = "{last}",
      }
      vim.g.slime_dont_ask_default = 1
      -- Fix code pasting to IPython.
      vim.g.slime_python_ipython = 1
      vim.g.slime_cell_delimiter = "#%%"
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("plugins.toggleterm_config")
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<space>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<space>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<space>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<space>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<space>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<space>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    -- config = function()
    --   require("trouble").setup({
    --     -- your configuration comes here
    --     -- or leave it empty to use the default settings
    --     -- refer to the configuration section below
    --   })
    -- end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Add quotes around words.
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- Interactive, regex-based search and replace.
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("plugins.spectre_config")
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}, {
  dev = {
    path = "~/.local/share/nvim/nix",
    fallback = false,
  },
})
