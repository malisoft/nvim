local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- FILE NAVIGATION
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
  --to set colors to tmux extension
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'edkolev/tmuxline.vim'

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- autopair
  use 'windwp/nvim-autopairs'

  -- to generate comments
  use 'winston0410/commented.nvim'

  --INTERFACE
  use 'rafi/awesome-vim-colorschemes'

  -- Highlighting by language
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  -- icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  use 'norcalli/nvim-colorizer.lua'
  -- to show parenthesis in colors like a rainbow
  use 'p00f/nvim-ts-rainbow'

  --HELPERS
-- Better annotation generator
  use {
      "danymat/neogen",
      requires = "nvim-treesitter/nvim-treesitter",
  }
  use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
  }

  -- fuzzy finder
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  --use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  -- use 'ibhagwan/fzf-lua'
  use { 'junegunn/fzf', run = './install --bin', }

-- Showing Diagnostic
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

  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
  }
  use { 'neovim/nvim-lspconfig' }
  use { "glepnir/lspsaga.nvim" }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use{'rafamadriz/friendly-snippets'}

    --to generate tag
  use{'windwp/nvim-ts-autotag'}

  -- to autoformat
  use{'mhartington/formatter.nvim'}

  -- Showing Pictograms suggest to complete in code
  use{'onsails/lspkind-nvim'}

  --to use git
  use 'kdheepak/lazygit.nvim'

  --for flutter
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
  use 'dart-lang/dart-vim-plugin'
  use 'natebosch/vim-lsc'
  use 'natebosch/vim-lsc-dart'

  use {
    'lewis6991/gitsigns.nvim',
  }
  use 'sidebar-nvim/sidebar.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
