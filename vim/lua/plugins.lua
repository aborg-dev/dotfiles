return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Visual plugins.
  use 'morhetz/gruvbox'

  -- Tool for profiling vim startup time.
  -- Use :StartupTime to run it.
  use 'dstein64/vim-startuptime'

  -- Tool to set up keybindings and visually see them.
  use {
	  'AckslD/nvim-whichkey-setup.lua',
	  requires = {'liuchengxu/vim-which-key'},
	  config = 'require("plugin_settings.which_key")',
  }

  -- Tool for fuzzy search over lists.
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
	  config = 'require("plugin_settings.telescope")',
  }

  -- Vim git client.
  use 'tpope/vim-fugitive'

  -- Lisp-y configuration.
  use { 
    'Olical/aniseed',
    -- config = function () vim.g['aniseed#env'] = true end
    config = function () vim.g['aniseed#env'] = { compile = false } end
  }

  -- Comment lines with 'gcc' and 'gc{motion}.
  use {
    "terrortylor/nvim-comment",
    config = function() require('nvim_comment').setup() end
  }

  -- Add shortcuts to jump between vim and tmux splits.
  use 'christoomey/vim-tmux-navigator'
end)
