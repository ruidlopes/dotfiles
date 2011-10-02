"
" .vimrc by Rui Lopes
"
" Requires the following plugins:
"
" * NERD_Commenter (smart source code commenting system)
" * autoclose (smart source code scope closing)
" * command-t (smart file opener)
" * snipMate (TextMate-alike Tab completion snippets)
" * space (smart spacebar interaction, e.g., for search)
"
" Additional stuff on .bash_profile:
"
" * alias vim="mvim --remote-tab-silent"
" * alias vim.="vim \$(find . -maxdepth 1 -type f -not -name \".*\" -print | sort)"
"


"
" 1. Sane GUI & file defaults
"

" font
set guifont=Monaco:h12

" window size for 11" MacBook Air (tweak via :set lines? and :set columns? after resizing the window to preferred size)
set lines=40
set columns=193

" no toolbar
set guioptions-=T

" line numbers
set nu

" noiseless beeps
set noerrorbells
set visualbell
set t_vb=

" cursor position
set ruler

" no crap backup nor swap files
set nobackup
set nowritebackup
set noswapfile

" file identification and management
filetype plugin on
set encoding=utf-8
set autochdir

" open current file in the system's bound application
"
" a shortcut key is bound at .gvimrc due to using :macmenu, as follows:
"
" if has("gui_macvim")
"   macmenu &File.Print key=<nop>
"   map <D-p> :Preview<CR><CR>
" endif
command Preview !open %:p


"
" 2. Sane keyboard shortcuts
"

" cmd+1...9 tab navigation
for i in range(1, 9)
    exec "nmap <D-".i."> ".i."gt i"
    exec "vmap <D-".i."> ".i."gt i"
    exec "imap <D-".i."> <ESC>".i."gt i"
endfor

" ctrl+T for activating Command-T plugin (thus maintaining cmd+T for new tab)
map <C-t> :CommandT<CR>

" cmd+/ to toggle commenting selected lines, based on NERD_Commenter
nmap <D-/> <Leader>c<space>
vmap <D-/> <Leader>c<space>
imap <D-/> <ESC><Leader>c<space>


" remap text selection and some other keys
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk


"
" 3. Sane text editing
"

" show source code scoping match (e.g., for parenthesis, curly braces, etc.)
set showmatch

" highlight cursor line
set cul

" soft tabs
set expandtab
set et
set tabstop=4
set shiftwidth=4

" no hard wrapping
set nowrap

" auto indent
set ai

" invisible characters
set invlist
set listchars=eol:¬

" improved search
set ignorecase
set smartcase
set incsearch
set hlsearch


"
" 4. Sane colour theme
"

" converted from Textmate theme Espresso Libre using Coloration v0.2.5 (http://github.com/sickill/coloration)
set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

syntax on

let g:colors_name = "Espresso Libre"

hi Cursor  guifg=NONE guibg=#889aff gui=NONE
hi Visual  guifg=NONE guibg=#c3dcff gui=NONE
hi CursorLine  guifg=NONE guibg=#3a312c gui=NONE
hi CursorColumn  guifg=NONE guibg=#3a312c gui=NONE
hi LineNr  guifg=#74685d guibg=#2a211c gui=NONE
hi VertSplit  guifg=#463c35 guibg=#463c35 gui=NONE
hi MatchParen  guifg=#43a8ed guibg=NONE gui=bold
hi StatusLine  guifg=#bdae9d guibg=#463c35 gui=bold
hi StatusLineNC  guifg=#bdae9d guibg=#463c35 gui=NONE
hi Pmenu  guifg=NONE guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#c3dcff gui=NONE
hi IncSearch  guifg=NONE guibg=#324e61 gui=NONE
hi Search  guifg=NONE guibg=#324e61 gui=NONE
hi Directory  guifg=#c5656b guibg=NONE gui=bold
hi Folded  guifg=#0066ff guibg=#2a211c gui=NONE

hi Normal  guifg=#bdae9d guibg=#2a211c gui=NONE
hi Boolean  guifg=#585cf6 guibg=NONE gui=bold
hi Character  guifg=#c5656b guibg=NONE gui=bold
hi Comment  guifg=#0066ff guibg=NONE gui=italic
hi Conditional  guifg=#43a8ed guibg=NONE gui=bold
hi Constant  guifg=#c5656b guibg=NONE gui=bold
hi Define  guifg=#43a8ed guibg=NONE gui=bold
hi ErrorMsg  guifg=#ffffff guibg=#990000 gui=NONE
hi WarningMsg  guifg=#ffffff guibg=#990000 gui=NONE
hi Float  guifg=#44aa43 guibg=NONE gui=NONE
hi Function  guifg=#ff9358 guibg=NONE gui=bold
hi Identifier  guifg=#43a8ed guibg=NONE gui=bold
hi Keyword  guifg=#43a8ed guibg=NONE gui=bold
hi Label  guifg=#049b0a guibg=NONE gui=NONE
hi NonText  guifg=#74685d guibg=NONE gui=NONE
hi Number  guifg=#44aa43 guibg=NONE gui=NONE
hi Operator  guifg=#43a8ed guibg=NONE gui=bold
hi PreProc  guifg=#43a8ed guibg=NONE gui=bold
hi Special  guifg=#bdae9d guibg=NONE gui=NONE
hi SpecialKey  guifg=#bfbfbf guibg=#3a312c gui=NONE
hi Statement  guifg=#43a8ed guibg=NONE gui=bold
hi StorageClass  guifg=#43a8ed guibg=NONE gui=bold
hi String  guifg=#049b0a guibg=NONE gui=NONE
hi Tag  guifg=NONE guibg=NONE gui=NONE
hi Title  guifg=#bdae9d guibg=NONE gui=bold
hi Todo  guifg=#0066ff guibg=NONE gui=inverse,bold,italic
hi Type  guifg=NONE guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#43a8ed guibg=NONE gui=bold
hi rubyFunction  guifg=#ff9358 guibg=NONE gui=bold
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#c5656b guibg=NONE gui=bold
hi rubyConstant  guifg=#6d79de guibg=NONE gui=bold
hi rubyStringDelimiter  guifg=#049b0a guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#318495 guibg=NONE gui=NONE
hi rubyInclude  guifg=#43a8ed guibg=NONE gui=bold
hi rubyGlobalVariable  guifg=#318495 guibg=NONE gui=NONE
hi rubyRegexp  guifg=#049b0a guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#049b0a guibg=NONE gui=NONE
hi rubyEscape  guifg=#2fe420 guibg=NONE gui=NONE
hi rubyControl  guifg=#43a8ed guibg=NONE gui=bold
hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyOperator  guifg=#43a8ed guibg=NONE gui=bold
hi rubyException  guifg=#43a8ed guibg=NONE gui=bold
hi rubyPseudoVariable  guifg=#318495 guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#6d79de guibg=NONE gui=bold
hi rubyRailsARAssociationMethod  guifg=#7290d9 guibg=NONE gui=bold
hi rubyRailsARMethod  guifg=#7290d9 guibg=NONE gui=bold
hi rubyRailsRenderMethod  guifg=#7290d9 guibg=NONE gui=bold
hi rubyRailsMethod  guifg=#7290d9 guibg=NONE gui=bold
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#0066ff guibg=NONE gui=italic
hi erubyRailsMethod  guifg=#7290d9 guibg=NONE gui=bold
hi htmlTag  guifg=#43a8ed guibg=NONE gui=NONE
hi htmlEndTag  guifg=#43a8ed guibg=NONE gui=NONE
hi htmlTagName  guifg=#43a8ed guibg=NONE gui=NONE
hi htmlArg  guifg=#43a8ed guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#c5656b guibg=NONE gui=bold
hi javaScriptFunction  guifg=#43a8ed guibg=NONE gui=bold
hi javaScriptRailsFunction  guifg=#7290d9 guibg=NONE gui=bold
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=NONE guibg=NONE gui=NONE
hi yamlAnchor  guifg=#318495 guibg=NONE gui=NONE
hi yamlAlias  guifg=#318495 guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=NONE guibg=#4f3a2c gui=NONE
hi cssURL  guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName  guifg=#7290d9 guibg=NONE gui=bold
hi cssColor  guifg=#c5656b guibg=NONE gui=bold
hi cssPseudoClassId  guifg=NONE guibg=NONE gui=NONE
hi cssClassName  guifg=NONE guibg=NONE gui=NONE
hi cssValueLength  guifg=#44aa43 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#00af0e guibg=NONE gui=bold
hi cssBraces  guifg=NONE guibg=NONE gui=NONE
