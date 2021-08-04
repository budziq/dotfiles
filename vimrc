set nu
set hlsearch
set incsearch
set ignorecase
set smartcase
set nocompatible
set mouse=a
set ttyfast

" no sounds please
set noerrorbells
set novisualbell

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
" make backspace behave sanely
set backspace=indent,eol,start
" remove automatic insertion of newline
set formatoptions-=tc
:syntax on
set encoding=utf-8
" remove the <esc> key delay
set timeoutlen=1000 ttimeoutlen=0

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" {{{ vundle bundles
" both required for vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" git support - original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
"let g:airline_extensions = ['branch', 'ale', 'hunks']

Bundle 'scrooloose/nerdtree'
Bundle 'w0rp/ale'
let g:ale_linters = {'go': ['gometalinter']}
"
"Bundle 'scrooloose/syntastic'
"let g:syntastic_disabled_filetypes=['vim']
"let g:syntastic_python_python_exec = 'python3'
"Bundle 'octol/vim-cpp-enhanced-highlight'

Bundle 'Valloric/MatchTagAlways'
"Bundle 'Valloric/YouCompleteMe'
"Plugin 'racer-rust/vim-racer'
let g:racer_experimental_completer = 1

set hidden
let g:racer_cmd = "/home/budziq/.cargo/bin/racer"

let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm_global_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_rust_src_path = $RUST_SRC_PATH
let g:ycm_python_binary_path = '/usr/bin/env python3'

Bundle 'rust-lang/rust.vim'
Bundle 'cespare/vim-toml'

Bundle 'airblade/vim-gitgutter'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'cscope_macros.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'fatih/vim-go'

set shellpipe=2>&1\|\ tee\ 

" Colorschemes
"Bundle 'morhetz/gruvbox'
Bundle 'rafi/awesome-vim-colorschemes'

call vundle#end()
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

" NERDTree options
map <leader>f :NERDTreeToggle<CR>
let NERDTreeWinSize=20

" generate ctags for c++ code
map <F6> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
nmap <F5> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>
map <Tab> :tn<CR>
map <S-Tab> :tp<CR>

set showfulltag

set tags+=~/tags/gbs_tags
set tags+=~/tags/gst_d4_tags
set tags+=~/tags/xvideo_d4_tags

set completeopt=longest,menuone

"bind the key for omnicomplete to ctrl-space"
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>

au FileType qf call AdjustWindowHeight(3, 6)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" we do not want line numbering when displaying man pages - it breaks display
au Filetype man set nonumber


set scrolloff=3
set laststatus=2
let b:ws_flags='i'

let python_highlight_all=1
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='hard'
"set t_Co=256
set background=dark
color gruvbox
"color hybrid_material
"color molokai
set termguicolors
highlight Comment gui=bold

hi SpellBad cterm=underline
"setting appropriate color-scheme depending on gui or not
if has("gui_running")
  set guifont=Meslo\ LG\ S\ for\ Powerline\ 9
  set guioptions-=T
  set spell
  set lines=40
  set columns=157
endif

"===== show cursor column and line
set cursorline
highlight Cursor gui=reverse guifg=NONE guibg=NONE

" load local non versioned vimrc if available
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
