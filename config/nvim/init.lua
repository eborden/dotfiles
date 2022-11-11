local map = vim.keymap.set
local Plug = vim.fn['plug#']

vim.call'plug#begin'

Plug 'dense-analysis/ale'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.0'})
Plug 'kelly-lin/telescope-ag'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'raichoo/haskell-vim'
Plug 'LnL7/vim-nix'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'christoomey/vim-tmux-navigator'
Plug 'etdev/vim-hexcolor'
Plug '5outh/yesod-routes.vim'
Plug 'junegunn/goyo.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'
Plug 'folke/which-key.nvim'

vim.call'plug#end'

vim.cmd'silent! helptags ALL'

-- Disable arrows
map('', '<Up>', '<Nop>', { noremap = true})
map('', '<Down>', '<Nop>', { noremap = true})
map('', '<Left>', '<Nop>', { noremap = true})
map('', '<Right>', '<Nop>', { noremap = true})

-- Disable Ex mode
map('', 'Q', '<Nop>', { noremap = true})

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd'syntax on'
vim.cmd'filetype on'
vim.cmd'filetype plugin indent on'
vim.opt.autoread = true
vim.opt.hid = true
vim.opt.lazyredraw = true

vim.opt.showmatch = true
vim.opt.mat = 2
vim.opt.mouse = 'a'
vim.opt.clipboard:append('unnamedplus')

-- Encoding
vim.opt.encoding = 'utf8'
vim.opt.ffs = 'unix,mac,dos'

-- Backups
vim.opt.backup = true
vim.cmd'set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp'
vim.opt.backupskip = '/tmp/*,/private/tmp/*e'
vim.cmd'set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp'
vim.opt.writebackup = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Colors
vim.cmd'set t_Co=256'
vim.opt.background = dark

-- Tabs
vim.opt.tabstop = 2 -- A tab is 2 spaces
vim.opt.expandtab = true -- Always uses spaces instead of tabs
vim.opt.softtabstop = 2 -- Insert 2 spaces when tab is pressed
vim.opt.shiftwidth = 2 -- An indent is 2 spaces
vim.opt.smarttab = true -- Indent instead of tab at start of line
vim.opt.shiftround = true -- Round spaces to nearest shiftwidth multiple
vim.opt.joinspaces = false -- Don't convert spaces to tabs

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.backspace = 'indent,eol,start'
map('v', '<C-c>', '+y', { desc = 'Copy', noremap = true })
map('i', '<C-v>', '<Esc>"+p i"', { desc = 'Paste', noremap = true })

-- Intentation
-------------------
vim.g.indent_guides_auto_colors = 0
vim.g.indent_guides_enable_on_vim_startup = 1
vim.cmd'autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=8'
vim.cmd'autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0'

-- Focus
-------------------
map('', '<Leader>g', ':Goyo<cr>', { desc = 'Toggle Goyo' })

-- Diff
-------------------
vim.opt.diffopt:append('vertical')

-- Explorer
-------------------
vim.g.netrw_liststyle = 3
map('', '<Leader>k', ':Explore<cr>', { desc = 'Explore under cursor' })

-- tpope's buffer navigation shortcuts
map('n', '[b', ':bprevious<CR>', { desc = 'previous buffer', silent = true, noremap = true })
map('n', ']b', ':bnext<CR>', { desc = 'next buffer', silent = true, noremap = true })
map('n', '[B', ':bfirst<CR>', { desc = 'first buffer', silent = true, noremap = true })
map('n', ']B', ':blast<CR>', { desc = 'last buffer', silent = true, noremap = true })

-- Status
-------------------
vim.cmd [[
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#right_sep = '◀'
]]
vim.g.tmuxline_powerline_separators = 0
vim.opt.laststatus = 2
vim.opt.cmdheight = 1
vim.cmd'set noshowmode'

-- Git
-------------------

-- Git Gutter
vim.g.gitgutter_sign_column_always = 1

vim.cmd'highlight SignColumn ctermbg=0'

-- Git Commit Length
vim.cmd'autocmd Filetype gitcommit setlocal spell textwidth=72'

-- Trim trailing whitespace on save
-------------------
vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e')

-- Syntax
-------------------

-- vcl syntax
vim.cmd'au BufRead,BufNewFile *.vcl :set ft=vcl'
vim.cmd'au! Syntax vcl source ~/.vim/syntax/vim-syntax-vcl/vcl.vim'

-- Hamlet files
vim.cmd'au BufReadPost *.ezt set syntax=html'

-- Markdown
vim.g.markdown_fenced_languages = {'html', 'python', 'bash=sh', 'haskell'}

-- Interpret LHS files as markdown by default
vim.cmd'autocmd BufNewFile,BufReadPost *.lhs set filetype=markdown'

-- Haskell Vim
vim.g.haskell_enable_quantification = 1 --to enable highlighting of forall
vim.g.haskell_enable_recursivedo = 1 --to enable highlighting of mdo and rec
vim.g.haskell_enable_arrowsyntax = 1 --to enable highlighting of proc
vim.g.haskell_enable_pattern_synonyms = 1 --to enable highlighting of pattern
vim.g.haskell_enable_typeroles = 1 --to enable highlighting of type roles

-- Haskell Indentation
vim.g.haskell_indent_before_where = 1
vim.g.haskell_indent_after_bare_where = 2
vim.g.haskell_indent_in = 0

-- ALE
-------------------
vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_enter = 1
vim.g.ale_open_list = 1

-- Telescope config
-------------------
require('telescope').setup{
  defaults = {
    layout_strategy='vertical'
  }
}
-- File search
map('n', '<C-P>', '<cmd>:Telescope find_files<CR>', { desc = 'file search' })
map('n', '<C-P><C-G>', '<cmd>:Telescope git_files<CR>', { desc = 'git file search' })
map('n', '<C-G><C-P>', '<cmd>:Telescope git_files<CR>', { desc = 'git file search' })

-- Buffer navigation
map('n', '<C-P><C-L>', '<cmd>:Telescope buffers<CR>', { desc = 'buffer search' })
map('n', '<C-L><C-P>', '<cmd>:Telescope buffers<CR>', { desc = 'buffer search' })

-- Tags
map('n', '<Leader>T', ':execute \'!\'.b:ctags_command<CR><CR>', { desc = 'rebuild tags' })

vim.cmd [[
autocmd BufEnter *
  \   if !exists('b:ctags_command')
  \ |   let b:ctags_command = 'ctags -R .'
  \ | endif
]]


-- orgmode
-------------------
-- load custom tree-sitter grammar for org filetype
require'orgmode'.setup_ts_grammar()

-- tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- if ts highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- required for spellcheck, some latex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- or run :tsupdate org
}

require'orgmode'.setup {
  org_agenda_files = {'~/dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/dropbox/org/refile.org',
}

-- which key config
-------------------
require'which-key'.setup {}
