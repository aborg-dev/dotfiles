return require("lazy").setup({
  -- Visual plugins.
  "morhetz/gruvbox",
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
      require "plugins.which_key"
    end,
  },

  -- Tool for fuzzy search over lists.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "kyazdani42/nvim-web-devicons" } },
    config = function()
      require "plugins.telescope"
    end,
  },

  -- Vim git client.
  "tpope/vim-fugitive",

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

  -- Quickly jump within the buffer with s{a}{b} and S{a}{b}.
  {
    "justinmk/vim-sneak",
    config = function()
      vim.g["sneak#label"] = 1
    end,
  },

  -- Auto-completion plugin.
  {
    "hrsh7th/nvim-cmp",
    ft = { "lua", "python", "fennel", "cpp", "rust", "go", "markdown", "beancount", "gdscript" },
    config = function()
      require "plugin_settings.nvim_cmp"
    end,
  },

  { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer", after = "cmp-nvim-lua" },
  { "hrsh7th/cmp-path", after = "cmp-buffer" },
  { "hrsh7th/cmp-calc", after = "cmp-path" },
  { "hrsh7th/cmp-cmdline", after = "cmp-calc" },

  -- Settings for commonly used LSP servers for different languages.
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require "plugin_settings.lsp"
    end,
  },
  -- Used for inline type annotation in Rust.
  "nvim-lua/lsp_extensions.nvim",

  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      require "plugins.rust"
    end,
  },

  -- Debug adaptor protocol.
  "mfussenegger/nvim-dap",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      -- require "plugins.dap_config"
    end,
  },

	"LnL7/vim-nix",

  -- Engine for parsing snippets.
	"SirVer/ultisnips",

  -- Actual snippets for multiple programming languages.
	"honza/vim-snippets",

	-- "nvim-treesitter/nvim-treesitter",

  -- Orgmode in vim, finally!
  {
    "nvim-orgmode/orgmode",
    config = function()
      -- require "plugins.orgmode_config"
    end,
  },

  -- Nicer bullet symbols for org headings.
  {
    "akinsho/org-bullets.nvim",
    config = function()
      require("org-bullets").setup {
        symbols = {
          headlines = { "◉", "○", "✸", "✿" },
        },
      }
    end,
  },

  {
    "sampsyo/bril",
    ft = { "bril" },
    rtp = "bril-vim",
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
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
    "mickael-menu/zk-nvim",
    config = function()
      -- require "plugins.zk_config"
    end,
  },

  {
    "dkarter/bullets.vim",
    config = function()
      vim.g.bullets_set_mappings = 0
      -- require "plugins.bullets_config"
    end,
  },

  "nathangrigg/vim-beancount",

  {
    "akinsho/toggleterm.nvim",
		version = "*",
    config = function()
      -- require "plugins.toggleterm_config"
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  "tpope/vim-unimpaired",

  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      -- require "plugins.octo_config"
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
})
