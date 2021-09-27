set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
syntax enable
set showcmd
set ruler
set encoding=UTF-8
set showmatch 
set sw=2
set rnu
set laststatus=2

call plug#begin('~/.vim/plugged')

"Themes
Plug 'morhetz/gruvbox'

"Functions like an Ide
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

"visual
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
"Plug 'leafgarland/typescript-vim'

"code modification
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release','do':'yarn install'}

Plug 'jwalton512/vim-blade'
"for blade autocompletation
Plug 'yaegassy/coc-blade-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-blade-formatter', {'do': 'npm install --ignore-scripts --no-lockfile --production --legacy-peer-deps.'}
call plug#end()
"Use F5 to refresh your editor with the config file that you specify here
nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>

let mapleader=" "

"for autoformat vim prettier
augroup autoformat_settings
    autocmd Filetype javascript prettier
augroup END
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"to change autogenerator code html for emmet
"let g:user_emmet_leader_key='<Leader>z'
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets_custom.json')), "\n"))

colorscheme gruvbox
let g:gruvbox_constrast_dark="hard"
let NERDTreeQuitOnOpen=1

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>nw :q!<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>

"to move in buffers
nnoremap <leader>k :bnext<CR>
nnoremap <leader>j :bprevious<CR>

"to open a terminal in a new tab
nnoremap <c-t> :split<CR>:ter<CR>
" Vim devicons
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
"configuring the highlight devicons
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeShowHidden=1

"to ultisnipets configurations
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"for coc.vim configurations
let g:coc_config_file="$HOME/.config/nvim/coc-settings.json"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"to put tabulation in selection with visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv
