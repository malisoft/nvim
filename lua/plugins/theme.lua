local cmd = vim.cmd
local opt = vim.opt
local g = vim.g                       -- global variables
--opt.background = "light"
g.tmuxline_preset = 'tmux'
--g.tmuxline_theme = 'bubblegum'
g.airline_theme = 'gotham'
cmd[[colorscheme jellybeans]]
cmd[[let g:airline#extensions#tabline#enabled = 1]] 
cmd[[let g:airline#extensions#tabline#left_sep = '']]
cmd[[let g:airline#extensions#tabline#left_alt_sep = '']]
cmd[[let g:airline_powerline_fonts = 1]]
