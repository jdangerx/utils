return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'justinmk/vim-sneak'
  use 'tpope/vim-surround'
  use 'tpope/vim-sleuth'

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use 'neovim/nvim-lspconfig'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
