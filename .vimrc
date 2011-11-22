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
":source ~/.vim/plugin/ShowWhitespace.vim
:source ~/.vim/rope.vim

:filetype on
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

set showfulltag

set tags+=~/__tags__/qt4tags
set tags+=~/tags/glibtags
set tags+=~/tags/gtktags
set tags+=~/tags/gstreamertags

set completeopt=longest,menuone,preview
let clang_complete_copen=1
let clang_complete_macros=1
let clang_complete_auto=0
let clang_auto_select=1
"let clang_use_library=1
"let clang_snippets=1
"let clang_periodic_quickfix=1
"let clang_conceal_snippets=1
let clang_user_options='|| exit 0'
"let clang_exec='/home/budziq/dev/git/clang+llvm-2.9-i686-linux/bin/clang'



au BufRead,BufNewFile *.json setfiletype=json 

autocmd FileType json set equalprg=json_reformat

"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal omnifunc=pysmell#Complete
"autocmd FileType cpp set omnifunc=cppcomplete#Complete
let ropevim_vim_completion=1
"let ropevim_codeassist_maxfixes=100"
let ropevim_enable_autoimport=1 
let ropevim_extended_complete=1

"bind the key for omnicomplete to ctrl-space"
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>



" --------- Rope
" Add rope complenition

function! TabWrapperRope()
    if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-R>=RopeCodeAssistInsertMode()\<CR>"
    endif
endfunction

au BufRead,BufNewFile *.py,*pyw imap <Tab> <C-R>=TabWrapperRope()<CR>
autocmd FileType python nnoremap <silent>, :call RopeShowDoc()<CR>


"===== show cursor column and line
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
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

:let python_highlight_all=1
set background=dark

if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"setting appropriate color-scheme depending on gui or not
if has("gui_running")
  colorscheme molokai
  set guifont=Monaco\ 10
  set guioptions-=T
  set spell
else
  "colorscheme wombat"
  colorscheme molokai
endif

" Bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" OO
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp,*.cxx match BadWhitespace /\s\+$/
