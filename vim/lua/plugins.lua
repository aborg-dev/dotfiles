-- Only required if you have packer configured as `opt`.
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim', opt = true }

  -- Visual plugins.
  use 'morhetz/gruvbox'

  -- Tool for profiling vim startup time.
  -- Use :StartupTime to run it.
  use 'tweekmonster/startuptime.vim'

  -- Tool to set up keybindings and visually see them.
  use {
    "folke/which-key.nvim",
    config = function() require("plugin_settings.which_key") end
  }

  -- Tool for fuzzy search over lists.
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require("plugin_settings.telescope") end
  }

  -- Vim git client.
  use 'tpope/vim-fugitive'

  -- Lisp-y configuration.
  use { 
    'Olical/aniseed',
		branch = 'develop',
    config = function () vim.g['aniseed#env'] = { output = '/lua/fnl' } end
  }

  use {
    'Olical/conjure',
    ft = {'fennel'}
  }

  -- Comment lines with 'gcc' and 'gc{motion}.
  use {
    "terrortylor/nvim-comment",
    config = function() require('nvim_comment').setup() end
  }

  -- Add shortcuts to jump between vim and tmux splits.
  use 'christoomey/vim-tmux-navigator'

  -- Quickly jump within the buffer with s{a}{b} and S{a}{b}.
  use {
    'justinmk/vim-sneak',
    config = function() vim.g['sneak#label'] = 1 end
  }

  -- Auto-completion plugin.
  use {
    'hrsh7th/nvim-compe',
    ft = {'lua', 'python', 'fennel', 'cpp'},
    config = function() require('plugin_settings.nvim_compe') end
  }
end)
