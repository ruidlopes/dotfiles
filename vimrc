" font
set guifont=Monaco:h12

" line numbers
set nu

" noiseless beeps
set noerrorbells
set visualbell
set t_vb=
set tm=500

" no crap backup nor swap files
set nobackup
set nowritebackup
set noswapfile

" default utf-8
set encoding=utf8

" file identification and management
filetype plugin on
filetype indent on

" cursor position
set ruler

" highlight cursor line
set cul

" set scroll pointer 7 lines to the cursor
set so=7

" soft tabs
set expandtab
set smarttab
set et
set tabstop=2
set shiftwidth=2
set softtabstop=2

" hard wrapping
set lbr
set wrap

" linebreak on 100 chars
set tw=100

" display 100 char column marker
set colorcolumn=100

" auto indent
set ai
set cindent

if exists("syntax_on")
  syntax reset
endif

" solarized
syntax on
set background=dark
colorscheme solarized

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+$/
