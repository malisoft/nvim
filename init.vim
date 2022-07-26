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
set undodir=~/.nvim/undo/backup
set undofile

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

call plug#begin('~/.nvim/plugged')
"file management
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'scrooloose/nerdcommenter'

"Themes
Plug 'rafi/awesome-vim-colorschemes'

"Functions like an Ide
Plug 'easymotion/vim-easymotion'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree'

"tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

"visual
Plug 'yggdroot/indentline'
Plug 'tpope/vim-projectionist'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"Javascript and typescript
Plug 'leafgarland/typescript-vim'
Plug 'jelera/vim-javascript-syntax'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'
Plug 'yaegassy/coc-blade-snippets', {'do': 'yarn install --frozen-lockfile'}

"code modification
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'leafOfTree/vim-matchtag'
Plug 'neoclide/coc.nvim', {'branch': 'release','do':'yarn install'}

"for blade autocompletation
Plug 'jwalton512/vim-blade'
"Plug 'dense-analysis/ale'
"Plug 'stephpy/vim-php-cs-fixer' "for correct the code in php to a standar

"for flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'Neevash/awesome-flutter-snippets'
Plug 'f-person/pubspec-assist-nvim'


" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'

" React code snippets
Plug 'epilande/vim-react-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'ianks/vim-tsx'

"git line changes
Plug 'airblade/vim-gitgutter'
call plug#end()


" Vim
let g:indentLine_color_term = 239

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

"Separators can be configured independently for the tabline, so here is how you can define "straight" tabs:
"
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setConceal  =  2
"Use F5 to refresh your editor with the config file that you specify here
nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>

let mapleader=" "

vmap <leader>o  <Plug>(coc-format-selected)
nmap <leader>o  <Plug>(coc-format-selected)
nmap <leader>ob  :call CocAction('format')<CR>

"to change autogenerator code html for emmet
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets_custom.json')), "\n"))

"for the theme
"colorscheme gruvbox
"let g:gruvbox_constrast_dark="hard"
set background=dark
set termguicolors
"colorscheme lucid
"colorscheme dogrun

colorscheme sonokai
"colorscheme oceanic_material
"colorscheme gotham
"colorscheme challenger_deep

"fot tmux
"let g:tmuxline_theme = 'zenburn'

"configuring NERDTree
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let NERDTreeQuitOnOpen=1

"for dart 
"let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>e :bdelete<CR>
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
"let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger="<C-l>"



" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"for coc.vim configurations
let g:coc_global_extensions = ['coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-flutter', 'coc-python', 'coc-emmet', 'coc-prettier', 'coc-vetur', 'coc-blade', 'coc-phpls', 'coc-diagnostic']  " list of CoC extensions needed
let g:coc_config_file="$HOME/.config/nvim/coc-settings.json"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)

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

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 set filetype=javascript
" TypeScript
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Fish
au BufNewFile,BufRead *.fish set filetype=fish


set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>d :CocCommand flutter.
nmap <leader>p :PubspecAssistAddDependency 
nmap <leader>pd :PubspecAssistAddDevDependency 

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nmap <C-P> :FZF<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" for matchtag
let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.ts,*.tsx,*.vue,*.svelte,*.jsp,*.php,*.erb'
