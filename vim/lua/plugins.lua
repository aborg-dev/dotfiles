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
end)
