" Configuration file for vim
"
set modelines=0		" CVE-2007-2438

set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" More powerful backspacing
set mouse=a		" Enable mouse support in xterm


" Appearance
syntax on
filetype plugin indent on
set background=dark

set number
set relativenumber
set ruler

"set textwidth=80	" Forces lines to wrap after 80 characters


" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir


" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


" Hihglight unwanted spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" In wrap mode, move cursor by display line
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

