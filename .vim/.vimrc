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

map T :TlistToggle<CR>
map F :NERDTreeToggle<CR>
map <C-F6> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
map <Tab> :tn<CR>
map <S-Tab> :tp<CR>

set showfulltag
"set tags=./tags"

set tags+=~/__tags__/qt4tags
set tags+=~/tags/glibtags
set tags+=~/tags/gtktags
set tags+=~/tags/gstreamertags

set completeopt=longest,menuone,preview


au BufRead,BufNewFile *.json setfiletype=json 

autocmd FileType json set equalprg=json_reformat

"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal omnifunc=pysmell#Complete
autocmd FileType cpp set omnifunc=cppcomplete#Complete
let ropevim_vim_completion=1
"let ropevim_codeassist_maxfixes=100"
let ropevim_enable_autoimport=1 
let ropevim_extended_complete=1

"bind the key for omnicomplete to ctrl-space"
"inoremap <C-space> <C-x><C-o>"
inoremap <C-Space> <C-x><C-o>
"inoremap <Nul> <C-x><C-o>"
inoremap <C-@> <C-x><C-o>


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


"setting appropriet colorscheme dependign on gui or not
if has("gui_running")
  "colorscheme wombat256" 
  colorscheme molokai
else
  "colorscheme wombat"
  colorscheme molokai
endif

if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

