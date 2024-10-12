" install plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  if !empty($HTTP_PROXY)
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs --insecure https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    let $GIT_SSL_NO_VERIFY = 1 " Disable SSL verification for Git
  else
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

    " pycharm theme
    Plug 'doums/darcula'
    "status bar theme
    Plug 'itchyny/lightline.vim'
    " enable folding
    Plug 'tmhedberg/SimpylFold'
    " auto indentation
    Plug 'vim-scripts/indentpython.vim'
    " auto completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " syntax checking/highlightin and PEP8 checking
    Plug 'vim-syntastic/syntastic'
    Plug 'nvie/vim-flake8'
    " git integration
    Plug 'tpope/vim-fugitive'
call plug#end()

" make code pretty
let python_highlight_all=1
syntax on

" fix problems with statusbar theme
set laststatus=2
set noshowmode

" set lightline theme
let g:lightline = {
      \ 'colorscheme': 'selenized_black',
      \ }

" set pycharm theme
colorscheme darcula
set termguicolors

" show line number
set number

" highlight matching parentheses
set showmatch

" center the current line
set scrolloff=999

" ignore case sensivity when searching
set ignorecase

" enable clipboard copy paste
set clipboard^=unnamedplus

" disable arrow keys
:map <Up> <Nop>
:map <Left> <Nop>
:map <Right> <Nop>
:map <Down> <Nop>

" ignore hidden buffer
set hidden

" be able to edit file in multiple windows 
set noswapfile

" show docstring of folded code
let g:SimpylFold_docstring_preview=1

" Flag unnecessary whitespace (highlight trailing spaces)
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h
    \ :match BadWhitespace /\s\+$/

" Define the BadWhitespace highlight group
highlight BadWhitespace ctermbg=red guibg=red

" UTF-8 support
set encoding=utf-8

" Use Tab for autocompletion navigation in coc.nvim
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make <CR> (Enter) select the current completion
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Use Ctrl-Space to trigger completion manually
inoremap <silent><expr> <C-Space> coc#refresh()

" ignore coc error xd
let g:coc_disable_startup_warning = 1
