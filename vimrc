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
set encoding=utf-8

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
let tagbar_autofocus=1
"Bundle 'godlygeek/csapprox'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
let g:syntastic_disabled_filetypes=['vim']
Bundle 'octol/vim-cpp-enhanced-highlight'

"Bundle 'hdima/python-syntax'

Bundle 'vim-scripts/python.vim--Vasiliev'

" --- Interesting plugins/bindles to be verified
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'ZoomWin'
Bundle 'Gundo'
" cool fuzzy mru file search
Bundle 'kien/ctrlp.vim'
" file search based on ack-grep #sudo apt-get install ack-grep
Bundle 'mileszs/ack.vim'
" if ag command exists base search on ag
if executable("ag")
    " git clone https://github.com/ggreer/the_silver_searcher
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

"Bundle 'davidhalter/jedi-vim'
Bundle 'gregsexton/gitv'
"Bundle 'vim-scripts/Vdebug'

Bundle 'chriskempson/base16-vim'
" cool code completioni - causes gvim explosion :(
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm_global_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0

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
" disable Ex mode
:map Q <Nop>
" Quit window on <leader>q
nnoremap <leader>q :q<CR>
" Quit all windows on <leader>Q
nnoremap <leader>Q :qall<CR>
" Paste from clipboard
map <leader>p "+gP

map <leader>t :TagbarToggle<CR>
map <leader>f :NERDTreeToggle<CR>
map <leader>g :GundoToggle<CR>
" generate ctags for c++ code
map <F6> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
map <Tab> :tn<CR>
map <S-Tab> :tp<CR>

set showfulltag

set tags+=~/tags/gbs_tags
set tags+=~/tags/gst_d4_tags
set tags+=~/tags/xvideo_d4_tags

set completeopt=longest,menuone,preview

"bind the key for omnicomplete to ctrl-space"
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>

au FileType qf call AdjustWindowHeight(3, 6)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction




set scrolloff=3
set laststatus=2
let b:ws_flags='i'

:let python_highlight_all=1

set t_Co=256
set background=dark
"colorscheme molokai

"setting appropriate color-scheme depending on gui or not
if has("gui_running")
  set guifont=Monaco\ 11
  set guioptions-=T
  set spell
  set lines=40
  set columns=157
endif

""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif


"===== show cursor column and line
set cursorline
highlight Cursor gui=reverse guifg=NONE guibg=NONE

" Bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp,*.cxx match BadWhitespace /\s\+$/



let base16colorspace=256  " Access colors present in 256 colorspace
color base16-monokai
"color base16-tomorrow
