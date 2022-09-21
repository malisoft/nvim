local cmd = vim.cmd
local opt = vim.opt
local g = vim.g -- global variables
--opt.background = "light"
g.tmuxline_preset = 'tmux'
--g.tmuxline_theme = 'bubblegum'
--oceanicnext
--pink-moon
--purify
--tender
--twofirewatch
--archery
--cobalt2 for tmux
--torte
--ayu
g.airline_theme = 'ayu_dark'
g.tmuxline_preset = {
  a    = '#S',
  win  = {'#I', '#W'},
  cwin = {'#I', '#W', '#F'},
  y    = {'%R', '%a', '%Y'},
  z    = '#H'
}

cmd[[colorscheme ayu]]

cmd[[let g:airline#extensions#tabline#enabled = 1]] 
cmd[[let g:airline#extensions#tabline#left_sep = '']]
cmd[[let g:airline#extensions#tabline#left_alt_sep = '']]
cmd[[let g:airline_powerline_fonts = 1]]
