" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir


" Preferences
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

syntax on
filetype plugin indent on
set background=dark
set mouse=a

set number
set relativenumber
set ruler
"set textwidth=80	" Enforce 80-characters lines
set colorcolumn=80	" Highlight column 80 for breaking long lines


" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


" Highlight search results (space to clear highlighting and messages)
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" Higlight unwanted spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" In wrap mode, move cursor by display line
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$


" Enable loading local vimrc
set exrc
