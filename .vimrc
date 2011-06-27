set nu
set hlsearch
let $PAGER=''
set ignorecase
set smartcase
set incsearch
set nocompatible
set mouse=a


set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
:syntax on


:source ~/.vim/plugin/matchit.vim
:source ~/.vim/plugin/ShowWhitespace.vim
:source ~/.vim/rope.vim

:filetype plugin on
command! W :w
command! Q :q

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
" Paste from clipboard
map <leader>p "+gP

map T :TlistToggle<CR>
map F :NERDTreeToggle<CR>
map <F6> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
"map <C-F6> :!ctags -R --python --fields=+iaS --extra=+q .<CR>
map <Tab> :tn<CR>
map <S-Tab> :tp<CR>

set laststatus=2
set showfulltag

set tags+=~/__tags__/qt4tags
set tags+=~/tags/glibtags
set tags+=~/tags/gtktags
set tags+=~/tags/gstreamertags

set completeopt=longest,menuone,preview
let clang_complete_copen=1
let clang_complete_macros=1
let clang_complete_patterns=1


au BufRead,BufNewFile *.json setfiletype=json 

autocmd FileType json set equalprg=json_reformat

"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal omnifunc=pysmell#Complete
"autocmd FileType cpp set omnifunc=cppcomplete#Complete
let ropevim_vim_completion=1
"let ropevim_codeassist_maxfixes=100"
let ropevim_enable_autoimport=1 

"bind the key for omnicomplete to ctrl-space"
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>

"===== show cursor column and line
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set cursorline
highlight Cursor gui=reverse guifg=NONE guibg=NONE

set scrolloff=3
set laststatus=2
let b:ws_flags = 'i'
"colorscheme maroloccio"
"colorscheme molokai"
"colorscheme two2tango"
"colorscheme mustang"
"colorscheme lettuce"
"colorscheme inkpot"
"colorscheme earendel"
"colorscheme darkspectrum"
"colorscheme dante"
"colorscheme asu1dark"


if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"setting appropriate color-scheme depending on gui or not
if has("gui_running")
  "colorscheme wombat256" 
  colorscheme molokai
  set guifont=Monaco\ 10
  set guioptions-=T
  set spell
else
  "colorscheme wombat"
  colorscheme molokai
endif

