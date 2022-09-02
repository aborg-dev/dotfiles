return require("packer").startup(function(use)
  -- Packer can manage itself.
  use { "wbthomason/packer.nvim", opt = true }

  -- Visual plugins.
  use "morhetz/gruvbox"
  -- Tool for profiling vim startup time.
  -- Use :StartupTime to run it.
  use "tweekmonster/startuptime.vim"

  -- Tool to set up keybindings and visually see them.
  -- Most of the plugins I use expose their shortcuts in a structured hierarchical
  -- manner using this plugin. The configuration is incrementally extended in
  -- the plugin-specific files.
  use {
    "folke/which-key.nvim",
    config = function()
      require "plugins.which_key"
    end,
  }

  -- Tool for fuzzy search over lists.
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = function()
      require "plugins.telescope"
    end,
  }

  -- Vim git client.
  use "tpope/vim-fugitive"

  -- Lisp-y configuration.
  use { "Olical/aniseed", opt = true }

  use {
    "Olical/conjure",
    ft = { "fennel" },
  }

  -- Comment lines with 'gcc' and 'gc{motion}.
  use {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
  }

  -- Add shortcuts to jump between vim and tmux splits.
  use "christoomey/vim-tmux-navigator"

  -- Quickly jump within the buffer with s{a}{b} and S{a}{b}.
  use {
    "justinmk/vim-sneak",
    config = function()
      vim.g["sneak#label"] = 1
    end,
  }

  -- Auto-completion plugin.
  use {
    "hrsh7th/nvim-cmp",
    ft = { "lua", "python", "fennel", "cpp", "rust", "go", "markdown", "beancount" },
    config = function()
      require "plugin_settings.nvim_cmp"
    end,
  }

  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lua" }
  use { "hrsh7th/cmp-path", after = "cmp-buffer" }
  use { "hrsh7th/cmp-calc", after = "cmp-path" }
  use { "hrsh7th/cmp-cmdline", after = "cmp-calc" }

  -- Settings for commonly used LSP servers for different languages.
  use "neovim/nvim-lspconfig"
  use {
    "williamboman/nvim-lsp-installer",
    config = function()
      require "plugin_settings.lsp"
    end,
  }
  -- Used for inline type annotation in Rust.
  use "nvim-lua/lsp_extensions.nvim"

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require "plugins.tree_sitter"
    end,
  }

  use { "nvim-treesitter/playground" }

  use {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      require "plugins.rust"
    end,
  }

  -- Debug adaptor protocol.
  use "mfussenegger/nvim-dap"
  use {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require "plugins.dap_config"
    end,
  }

  use {
    "LnL7/vim-nix",
  }

  -- Engine for parsing snippets.
  use {
    "SirVer/ultisnips",
  }

  -- Actual snippets for multiple programming languages.
  use {
    "honza/vim-snippets",
  }

  -- Orgmode in vim, finally!
  use {
    "nvim-orgmode/orgmode",
    config = function()
      require "plugins.orgmode_config"
    end,
  }

  -- Nicer bullet symbols for org headings.
  use {
    "akinsho/org-bullets.nvim",
    config = function()
      require("org-bullets").setup {
        symbols = {
          headlines = { "◉", "○", "✸", "✿" },
        },
      }
    end,
  }

  use {
    "sampsyo/bril",
    ft = { "bril" },
    rtp = "bril-vim",
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  }

  use {
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
  }

  use {
    "mickael-menu/zk-nvim",
    config = function()
      require "plugins.zk_config"
    end,
  }

  use {
    "dkarter/bullets.vim",
    config = function()
      vim.g.bullets_set_mappings = 0
      require "plugins.bullets_config"
    end,
  }

  use { "nathangrigg/vim-beancount" }

  use {
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-\>]],
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      }
    end,
  }
end)
