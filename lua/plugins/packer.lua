local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  use 'wbthomason/packer.nvim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  -- file explorer
  --use 'kyazdani42/nvim-tree.lua'
  use {
      'nvim-neo-tree/neo-tree.nvim',
      branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim"
    },
  }

  use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
  }

  -- side bar in the  footer
  use 'sidebar-nvim/sidebar.nvim'

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- colorschemes
  use 'Shatur/neovim-ayu'
  --use 'navarasu/onedark.nvim'


  -- autopair
  use 'windwp/nvim-autopairs'

  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'
  --use 'nvim-treesitter/nvim-tree-docs'
  --use 'p00f/nvim-ts-rainbow'

-- neogen
use {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
}


  -- tabs
  --use {
  --  'nanozuki/tabby.nvim',
  --  requires = { 'kyazdani42/nvim-web-devicons' },
  --}


  -- tagviewer
  use 'liuchengxu/vista.vim'



  -- fuzzy finder
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'ibhagwan/fzf-lua'

-- Lua
use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'f3fora/cmp-spell',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use {'tzachar/cmp-tabnine',
     run='./install.sh',
     requires = 'hrsh7th/nvim-cmp'
  }


  use {'onsails/lspkind-nvim'}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
