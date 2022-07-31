local cmd = vim.cmd
local opt = vim.opt
local g = vim.g                       -- global variables
--opt.background = "light"
cmd[[colorscheme ayu-mirage]]
g.tmuxline_preset = 'tmux'
g.tmuxline_theme = 'iceberg'
--cmd[[let g:lightline={ 'enable': {'statusline': 1, 'tabline': 0} }]]
--cmd[[let g:tmuxline_theme = 'zenburn']]
--require('awesome-vim-colorschemes').colorscheme('sonakai')
--require('sonakai').colorscheme()

