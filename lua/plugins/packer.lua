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
  use 'edkolev/tmuxline.vim'
  -- side bar in the  footer
  use 'sidebar-nvim/sidebar.nvim'

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- autopair
  use 'windwp/nvim-autopairs'
  -- to generate comments
  use 'winston0410/commented.nvim'

  --INTERFACE
  use 'Shatur/neovim-ayu'
  -- Highlighting by language
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'
  -- icons
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'
  -- to show parenthesis in colors like a rainbow
  use 'p00f/nvim-ts-rainbow'
  --use 'nvim-treesitter/nvim-tree-docs'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  --HELPERS
-- Better annotation generator
  use {
      "danymat/neogen",
      requires = "nvim-treesitter/nvim-treesitter",
  }
  use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
      -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
  }

  -- fuzzy finder
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'ibhagwan/fzf-lua'

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

  -- autocomplete
  use{'neovim/nvim-lspconfig'}
  use{'hrsh7th/cmp-nvim-lsp'}
  use{'hrsh7th/cmp-buffer'}
  use{'hrsh7th/cmp-path'}
  use{'hrsh7th/cmp-cmdline'}
  use{'hrsh7th/nvim-cmp'}

  use{'L3MON4D3/LuaSnip'}
  use{'saadparwaiz1/cmp_luasnip'}

  use {'tzachar/cmp-tabnine',
     run='./install.sh',
     requires = 'hrsh7th/nvim-cmp'
  }

  --to generate tag
  use{'windwp/nvim-ts-autotag'}
  -- Showing Pictograms suggest to complete in code
  use {'onsails/lspkind-nvim'}

  --for flutter
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
  use 'dart-lang/dart-vim-plugin'
  use 'natebosch/vim-lsc'
  use 'natebosch/vim-lsc-dart'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
