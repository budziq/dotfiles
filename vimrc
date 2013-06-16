set nu
set hlsearch
set incsearch
let $PAGER=''
set ignorecase
set smartcase
set nocompatible
set mouse=a
set lazyredraw

" no sounds please
set noerrorbells
set novisualbell

set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
" make backspace behave sanely
set backspace=indent,eol,start
" remove automatic insertion of newline
set formatoptions-=t
:syntax on

let g:valgrind_command='export G_SLICE=always-malloc G_DEBUG=gc-friendly && valgrind'
let g:valgrind_arguments=' --leak-check=yes --track-origins=yes --error-limit=no --suppressions=/home/budziq/dev/magister/Qt47supp.txt'

:source ~/.vim/plugin/matchit.vim

" {{{ vundle bundles
" both required for vundle
filetype off 
set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" git support - original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'

Bundle 'majutsushi/tagbar'
Bundle 'godlygeek/csapprox'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

" --- Interesting plugins/bindles to be verified
"Bundle 'Rip-Rip/clang_complete'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'ZoomWin'
"Bundle 'Gundo'
"Bundle 'IndentGuides'
"Bundle 'kien/ctrp.vim'
" fuzzy finder - vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'

"Bundle 'davidhalter/jedi-vim'
"Bundle 'gregsexton/gitv'
"Bundle 'vim-scripts/Vdebug'

" cool code completioni - causes gvim explosion :(
"Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on     " Required by Vundle
    "
    " Brief help
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
    "
    " see :h vundle for more details or wiki for FAQ
    " NOTE: comments after Bundle command are not allowed..
    "
    " for bundle install
    "     vim +BundleInstall +qall
    " for clean bundle install/reinstall
    "     vim +BundleClean +BundleInstall! +qa
    "
"}}} 

" Save and quit also on capitals like any sane person 
command! W :w
command! Q :q

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
" Paste from clipboard
map <leader>p "+gP

map T :TagbarToggle<CR>
map F :NERDTreeToggle<CR>
" generate ctags for c++ code
map <F6> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
map <Tab> :tn<CR>
map <S-Tab> :tp<CR>

set showfulltag

set tags+=~/__tags__/qt4tags
set tags+=~/tags/glibtags
set tags+=~/tags/gtktags
set tags+=~/tags/gstreamertags

set completeopt=longest,menuone,preview

"bind the key for omnicomplete to ctrl-space"
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>

au FileType qf call AdjustWindowHeight(3, 6)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction


"===== show cursor column and line
set cursorline
highlight Cursor gui=reverse guifg=NONE guibg=NONE



set scrolloff=3
set laststatus=2
let b:ws_flags='i'

:let python_highlight_all=1
set background=dark

set t_Co=256

"setting appropriate color-scheme depending on gui or not
if has("gui_running")
  colorscheme molokai
  set guifont=Monaco\ 11
  set guioptions-=T
  set spell
  set lines=40
  set columns=157
else
  colorscheme molokai
endif


" Bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp,*.cxx match BadWhitespace /\s\+$/
