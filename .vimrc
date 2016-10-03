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

" Disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Disable Ex mode
noremap Q <Nop>

let mapleader = "\<Space>"

syntax on
filetype on
filetype plugin indent on
set autoread
set hid
set lazyredraw

set showmatch
set mat=2
set mouse=a
set clipboard+=unnamedplus

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

set relativenumber
set backspace=indent,eol,start
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+p i

" Diff
set diffopt+=vertical

" Explorer
let g:netrw_liststyle=3
map <leader>k :Explore<cr> 

" Ctrl P
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                            \ --ignore .git
                            \ --ignore .svn
                            \ --ignore .hg
                            \ --ignore dist
                            \ --ignore build
                            \ --ignore .hi
                            \ --ignore .ho
                            \ --ignore .o
                            \ --ignore .so
                            \ --ignore .dll
                            \ --ignore .db
                            \ --ignore .exe
                            \ -g ""'

" Status
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#right_sep = '◀'
let g:tmuxline_powerline_separators = 0

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

"intentation
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

"vcl syntax
au BufRead,BufNewFile *.vcl :set ft=vcl
au! Syntax vcl source ~/.vim/syntax/vim-syntax-vcl/vcl.vim

"Neomake
autocmd! BufWritePost * Neomake
