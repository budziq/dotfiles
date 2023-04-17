set nu
set hlsearch
set incsearch
set ignorecase
set smartcase
set nocompatible
set mouse=a
set ttyfast
set lazyredraw

" no sounds please
set noerrorbells
set novisualbell

set expandtab
" do not physically wrap my lines damn it!
set textwidth=0
set wrapmargin=0

" do not hide any characters from me!
set conceallevel=0

set tabstop=4
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
" remove the <esc> key delay
set timeoutlen=1000 ttimeoutlen=0

cnoreabbrev X x

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

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

Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'zenburn'
"let g:airline_extensions = ['branch', 'ale', 'hunks']

"Bundle 'majutsushi/tagbar'
"let tagbar_autofocus=1
Bundle 'scrooloose/nerdtree'
"Bundle 'tomtom/tcomment_vim'
let g:NERDTreeDirArrows = 1

Plugin 'fatih/vim-go'
let g:go_version_warning = 0

Plugin 'rust-lang/rust.vim'
"Plugin 'vim-syntastic/syntastic'
"let g:syntastic_rust_checkers = ['rustc', 'cargo', 'rls']
"Plugin 'w0rp/ale'
"Plugin 'AndrewRadev/linediff.vim'

"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
"if has('nvim')
"    inoremap <silent><expr> <c-space> coc#refresh()
"else
"    inoremap <silent><expr> <c-@> coc#refresh()
"endif

Plugin 'dense-analysis/ale'
"Plugin 'budziq/ale'
let g:ale_linters = {
\   'javascript': ['eslint', 'jshint'],
\    'rust': ['rustc', 'cargo', 'rls'],
\}
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
"let g:ale_open_list = 1

Bundle 'octol/vim-cpp-enhanced-highlight'

"Bundle 'Valloric/MatchTagAlways'
"Bundle 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm_global_conf.py'
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_rust_src_path = '/home/budziq/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
"let g:ycm_python_binary_path = '/usr/bin/env python3'

"let g:ycm_filetype_specific_completion_to_disable = {
"      \ 'python': 1
"      \}
"Plugin 'davidhalter/jedi-vim'

"Plugin 'vasconcelloslf/vim-interestingwords'
"Plugin 'kien/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'bronson/vim-trailing-whitespace'
Plugin 'cscope_macros.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'elzr/vim-json'
Plugin 'cespare/vim-toml'
Plugin 'powerman/vim-plugin-AnsiEsc'

" Colorschemes
Plugin 'morhetz/gruvbox'

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
nnoremap <leader>Q :qall!<CR>
" Paste from clipboard
map <leader>p "+gP

map <leader>t :TagbarToggle<CR>
map <leader>f :NERDTreeToggle<CR>
" generate ctags for c++ code
map <F6> :!ctags-exuberant -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
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
"au BufRead,BufNewFile *.go inoremap <C-Space> <C-x><C-o>
"au BufRead,BufNewFile *.go inoremap <C-@> <C-x><C-o>

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>

au FileType qf call AdjustWindowHeight(3, 6)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" do not hide json syntax
let g:vim_json_syntax_conceal = 0

" we do not want line numbering when displaying man pages - it breaks display
au Filetype man set nonumber


set scrolloff=3
set laststatus=2
let b:ws_flags='i'

:let python_highlight_all=1

set t_Co=256
set background=dark
color gruvbox
"color hybrid

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


