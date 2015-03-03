execute pathogen#infect()
" Plugins:
" - ctrlp.vim
" - haskell-vim
" - neco-ghc
" - syntastic
" - vim-airline
" - vim-colors-solarized
" - vim-fugitive
" - vim-gitgutter.git

syntax on
filetype on
filetype plugin indent on
set autoread
set hid
set lazyredraw

set showmatch
set mat=2

" Encoding
set encoding=utf8
set ffs=unix,mac,dos

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Colors
set t_Co=256
set background=dark
colorscheme solarized

" Tabs
set tabstop=2                   "A tab is 2 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=2               "Insert 2 spaces when tab is pressed
set shiftwidth=2                "An indent is 2 spaces
set smarttab                    "Indent instead of tab at start of line
set shiftround                  "Round spaces to nearest shiftwidth multiple
set nojoinspaces                "Don't convert spaces to tabs

set backspace=indent,eol,start
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+p i

" Ctrl P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|dist)$',
  \ 'file': '\v\.(exe|so|dll|hi|ho|o|db)$',
  \ }

" Status
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#right_sep = '◀'

set laststatus=2
set cmdheight=1
set noshowmode

" Git Gutter
let g:gitgutter_sign_column_always = 1
highlight SignColumn ctermbg=0

"Haskell Vim
let g:haskell_enable_quantification = 1 "to enable highlighting of forall
let g:haskell_enable_recursivedo = 1 "to enable highlighting of mdo and rec
let g:haskell_enable_arrowsyntax = 1 "to enable highlighting of proc
let g:haskell_enable_pattern_synonyms = 1 "to enable highlighting of pattern
let g:haskell_enable_typeroles = 1 "to enable highlighting of type roles

