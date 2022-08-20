-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use {
     'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
   }
   use {
     'nvim-telescope/telescope.nvim', 
     tag = '0.1.0',
     requires = { 'nvim-lua/plenary.nvim' }
   }
	 use { "nvim-telescope/telescope-file-browser.nvim" }
	 use { "sainnhe/gruvbox-material"  }
	 use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
   use 'neovim/nvim-lspconfig'
   use {'nvim-telescope/telescope-ui-select.nvim' }
   use 'b3nj5m1n/kommentary'
   use {
     'akinsho/bufferline.nvim', 
     tag = "v2.*", 
     requires = 'kyazdani42/nvim-web-devicons'
   }
   use 'nvim-treesitter/nvim-treesitter'
	 use {
		 'ms-jpq/coq_nvim',
		 branch = 'coq'
	 }
end)
