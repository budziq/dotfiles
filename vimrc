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

:filetype on
:filetype plugin on

" Save and quit also on capitals like any sane person 
command! W :w
command! Q :q

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
" Paste from clipboard
map <leader>p "+gP

map T :TlistToggle<CR>
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

au BufRead,BufNewFile *.json setfiletype=json 

autocmd FileType json set equalprg=json_reformat


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
let g:git_branch_status_nogit=""
let g:git_branch_status_head_current=1
let g:git_branch_status_ignore_remotes=1
let g:git_branch_status_text=""
"set statusline=%<%f%m%r%y%=%b\ 0x%B\ \ %l,%c%V\ %P
set statusline=%<%f%m%r%y%=%b\ 0x%B\ \ %l,%c%V\ %P\ %#Question#%{GitBranchInfoString()}
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
