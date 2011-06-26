"=
" cream-colors-navajo-night.vim
"
" Cream -- An easy-to-use configuration of the famous Vim text editor
" [ http://cream.sourceforge.net ] Copyright (C) 2001-2009 Steve Hall
"
" License:
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 3 of the License, or
" (at your option) any later version.
" [ http://www.gnu.org/licenses/gpl.html ]
"
" This program is distributed in the hope that it will be useful, but
" WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
" General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program; if not, write to the Free Software
" Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
" 02111-1307, USA.
"
"
"----------------------------------------------------------------------
" Vim colour file
" Maintainer: Matthew Hawkins <matt@mh.dropbear.id.au>
" Last Change:	Mon, 22 Apr 2002 15:28:04 +1000
" URI: http://mh.dropbear.id.au/vim/navajo-night.png
"
" This colour scheme uses a "navajo-black" background
" I have added colours for the statusbar and for spell checking
" as taken from Cream (http://cream.sf.net/)

set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif

"let g:colors_name = "cream-navajo-night"

" This is the list of colour changes from Navajo that
" weren't a simple mathematical subtraction from 0xffffff
" DarkBlue -> #ffff74
" DarkRed -> #74ffff
" DarkGreen -> #ff9bff
" DarkCyan -> #ff7474
" DarkMagenta -> #74ff74
" DarkYellow -> #7474ff
" DarkGray -> #565656
" Blue -> Yellow
" Red -> Cyan
" Yellow -> Blue
" Gray -> #414141
" Brown -> #5ad5d5
" #ff8060 -> #007f9f
" #f6e8d0 -> #09172f
" #edb5cd -> #124a32
" #c0c0c0 -> #3f3f3f
" #907050 -> #6f8faf
" #808080 -> #7f7f7f
" #707070 -> #8f8f8f
" SeaGreen -> #d174a8
" LightRed (assuming #ee9090) -> #116f6f
" LightBlue -> #522719

highlight Normal ctermfg=White guifg=White guibg=#35536f

"+++ Cream:
"highlight SpecialKey term=bold ctermfg=darkblue guifg=Yellow
highlight SpecialKey term=bold ctermfg=darkblue guifg=#bfbfef
"highlight NonText term=bold ctermfg=darkblue cterm=bold gui=bold guifg=#7f7f7f
highlight NonText term=bold ctermfg=darkblue cterm=bold gui=bold guifg=#bfbfef
"+++
highlight Directory term=bold ctermfg=darkblue guifg=Yellow
highlight ErrorMsg term=standout ctermfg=grey ctermbg=darkred cterm=bold gui=bold guifg=Black guibg=Cyan
highlight IncSearch term=reverse cterm=reverse gui=reverse
"+++ Cream:
"highlight Search term=reverse ctermbg=White ctermfg=Black cterm=reverse guibg=Black guifg=Yellow
highlight Search term=reverse ctermbg=White ctermfg=Black cterm=reverse guibg=#003333 guifg=Yellow
"+++
highlight MoreMsg term=bold ctermfg=green gui=bold guifg=#d174a8
highlight ModeMsg term=bold cterm=bold gui=bold
highlight LineNr term=underline ctermfg=darkcyan ctermbg=grey guibg=#7f7f7f gui=bold guifg=White
highlight Question term=standout ctermfg=darkgreen gui=bold guifg=#d174a8
highlight StatusLine term=bold,reverse cterm=bold,reverse gui=bold guifg=Black guibg=White
highlight StatusLineNC term=reverse cterm=reverse gui=bold guifg=#116f6f guibg=#8f8f8f
highlight VertSplit term=reverse cterm=reverse gui=bold guifg=Black guibg=#8f8f8f
highlight Title term=bold ctermfg=green gui=bold guifg=#74ff74
"+++ Cream:
"highlight Visual term=reverse cterm=reverse gui=reverse guifg=#3f3f3f guibg=White
"+++
highlight VisualNOS term=bold,underline cterm=bold,underline gui=reverse guifg=#414141 guibg=Black
highlight WarningMsg term=standout ctermfg=darkred gui=bold guifg=Cyan
highlight WildMenu term=standout ctermfg=White ctermbg=darkyellow guifg=White guibg=Blue
highlight Folded term=standout ctermfg=darkblue ctermbg=grey guifg=White guibg=NONE guifg=#afcfef
highlight FoldColumn term=standout ctermfg=darkblue ctermbg=grey guifg=#ffff74 guibg=#3f3f3f
highlight DiffAdd term=bold ctermbg=darkblue guibg=Black
highlight DiffChange term=bold ctermbg=darkmagenta guibg=#124a32
highlight DiffDelete term=bold ctermfg=darkblue ctermbg=blue cterm=bold gui=bold guifg=#522719 guibg=#09172f
highlight DiffText term=reverse ctermbg=darkblue cterm=bold gui=bold guibg=#007f9f
highlight Cursor gui=reverse guifg=#bfbfef guibg=Black
highlight lCursor guifg=fg guibg=bg
highlight Match term=bold,reverse ctermbg=Blue ctermfg=Yellow cterm=bold,reverse gui=bold,reverse guifg=Blue guibg=Yellow


" Colours for syntax highlighting
highlight Comment term=bold ctermfg=darkblue guifg=#e7e77f
highlight Constant term=underline ctermfg=darkred guifg=#3fffa7
highlight Special term=bold ctermfg=darkgreen guifg=#bfbfef
highlight Identifier term=underline ctermfg=darkcyan cterm=NONE guifg=#ef9f9f
highlight Statement term=bold ctermfg=darkred cterm=bold gui=bold guifg=#5ad5d5
highlight PreProc term=underline ctermfg=darkmagenta guifg=#74ff74
highlight Type term=underline ctermfg=green gui=bold guifg=#d174a8
highlight Ignore ctermfg=grey cterm=bold guifg=bg

highlight Error term=reverse ctermfg=grey ctermbg=darkred cterm=bold gui=bold guifg=Black guibg=Cyan
highlight Todo term=standout ctermfg=darkblue ctermbg=Blue guifg=Yellow guibg=Blue

" Test fold area




" end fold area


"+++ Cream:

" statusline
highlight User1  gui=bold guifg=#999933 guibg=#45637f
highlight User2  gui=bold guifg=#e7e77f guibg=#45637f
highlight User3  gui=bold guifg=#000000 guibg=#45637f
highlight User4  gui=bold guifg=#33cc99 guibg=#45637f

" bookmarks
highlight Cream_ShowMarksHL ctermfg=blue ctermbg=lightblue cterm=bold gui=bold guifg=#000000 guibg=#aacc77

" spell check
highlight BadWord ctermfg=black ctermbg=lightblue gui=NONE guifg=#ff9999 guibg=#003333

" current line
highlight CurrentLine term=reverse ctermbg=0 ctermfg=14 gui=none guibg=#15334f

" email
highlight EQuote1 guifg=#ffff33
highlight EQuote2 guifg=#cccc33
highlight EQuote3 guifg=#999933
highlight Sig guifg=#aaaaaa

"+++

