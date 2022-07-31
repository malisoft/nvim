require('settings')
require('keymaps')
require('plugins/packer')
--PLUGINS--
--This is the theme
--require('plugins/ayu')
require('plugins/theme')
--File Navigator
require('plugins/neo-tree')
--SideBar but i think is unnecessary
require('plugins/sidebar-nvim')
require('plugins/barbar')
--To show you when a salt of line or there are spaces
require('plugins/indent-blankline')
--snippets
--require('plugins/luasnip')
--Descrition generator
require('plugins/neogen')
--File finder
require('plugins/telescope-nvim')
--A pretty list for showing lsp diagnostics
require('plugins/trouble')
--Document jumper
require('plugins/hop')
--Highlighting Document
require('plugins/nvim-treesitter')
require('plugins/nvim-treesitter-context')
--Exelent to type [] {} and close it
require('plugins/nvim-autopairs')
--To show the color
require('plugins/nvim-colorizer')
--to have button tabline
require('plugins/lualine')
--Statusline down
--To close html tag
require('plugins/nvim-ts-autotag')
--To generate comments
require('plugins/commented')
--Autocompleter
require('plugins/nvim-lspconfig')
require('plugins/nvim-tabnine')
require('plugins/nvim-cmp')
