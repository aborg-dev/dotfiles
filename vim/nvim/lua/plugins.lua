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
    "hrsh7th/nvim-compe",
    ft = { "lua", "python", "fennel", "cpp", "rust" },
    config = function()
      require "plugin_settings.nvim_compe"
    end,
  }

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

  use {
    "rust-lang/rust.vim",
    ft = { "rust" },
    config = function()
      require "plugins.rust"
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
	use {"akinsho/org-bullets.nvim", config = function()
		require("org-bullets").setup {
			symbols = { "◉", "○", "✸", "✿" }
		}
	end}
end)
