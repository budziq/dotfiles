"=
" cream-colors-night.vim
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
"----------------------------------------------------------------------
" Vim color file
" Maintainer:   tiza
" Last Change:  2002/02/22 Fri 18:56.
" version: 1.1
" GUI only

" This color scheme uses a dark background.

set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif

"let g:colors_name = "cream-night"

highlight Normal       guifg=#ffffff guibg=#303040

highlight IncSearch    gui=UNDERLINE,BOLD guifg=#ffffff guibg=#d000d0
highlight Search       gui=BOLD guifg=#ffd0ff guibg=#c000c0

highlight ErrorMsg     gui=BOLD guifg=#ffffff guibg=#ff0088
highlight WarningMsg   gui=BOLD guifg=#ffffff guibg=#ff0088
highlight ModeMsg      gui=BOLD guifg=#00e0ff guibg=NONE
highlight MoreMsg      gui=BOLD guifg=#00ffdd guibg=NONE
highlight Question     gui=BOLD guifg=#ff90ff guibg=NONE

"+++ Cream: set elsewhere
"highlight StatusLine   gui=BOLD guifg=#ffffff guibg=#7700ff
"highlight StatusLineNC gui=BOLD guifg=#c0b0ff guibg=#7700ff
"+++

highlight VertSplit    gui=NONE guifg=#ffffff guibg=#7700ff
highlight WildMenu     gui=BOLD guifg=#ffffff guibg=#d08020

"+++ Cream: prefer bold (set elsewhere, too)
"highlight Visual       gui=NONE guifg=#ffffff guibg=#7070c0
highlight Visual       gui=bold guifg=#ffffff guibg=#7070c0
"+++

highlight DiffText     gui=NONE guifg=#ffffff guibg=#40a060
highlight DiffChange   gui=NONE guifg=#ffffff guibg=#007070
highlight DiffDelete   gui=BOLD guifg=#ffffff guibg=#40a0c0
highlight DiffAdd      gui=NONE guifg=#ffffff guibg=#40a0c0

highlight Cursor       gui=NONE guifg=#ffffff guibg=#ff9020
highlight lCursor      gui=NONE guifg=#ffffff guibg=#ff00d0
highlight CursorIM     gui=NONE guifg=#ffffff guibg=#ff00d0

highlight Folded       gui=BOLD guifg=#e8e8f0 guibg=#606078
highlight FoldColumn   gui=NONE guifg=#a0a0b0 guibg=#404050

highlight Directory    gui=NONE guifg=#00ffff guibg=NONE
highlight Title        gui=BOLD guifg=#ffffff guibg=#8000d0
highlight LineNr       gui=NONE guifg=#808098 guibg=NONE
highlight NonText      gui=BOLD guifg=#8040ff guibg=#383848
highlight SpecialKey   gui=BOLD guifg=#60a0ff guibg=NONE

" Groups for syntax highlighting
highlight Comment      gui=BOLD guifg=#ff60ff guibg=NONE
highlight Constant     gui=NONE guifg=#ffffff guibg=#4822bb
highlight Special      gui=NONE guifg=#44ffff guibg=#4822bb
highlight Identifier   gui=NONE guifg=#90d0ff guibg=NONE
highlight Statement    gui=BOLD guifg=#00ccbb guibg=NONE
highlight PreProc      gui=NONE guifg=#40ffa0 guibg=NONE
highlight Type         gui=BOLD guifg=#bb99ff guibg=NONE
highlight Todo         gui=BOLD guifg=#ffffff guibg=#ff0088
highlight Ignore       gui=NONE guifg=#303040 guibg=NONE
highlight Error        gui=BOLD guifg=#ffffff guibg=#ff0088

" HTML
highlight htmlLink                 gui=UNDERLINE
highlight htmlBoldUnderline        gui=BOLD
highlight htmlBoldItalic           gui=BOLD
highlight htmlBold                 gui=BOLD
highlight htmlBoldUnderlineItalic  gui=BOLD
highlight htmlUnderlineItalic      gui=UNDERLINE
highlight htmlUnderline            gui=UNDERLINE
highlight htmlItalic               gui=italic

"+++ Cream:

" statusline
highlight User1  gui=BOLD guifg=#303040 guibg=#7777c0
highlight User2  gui=bold guifg=#ffffff guibg=#7777c0
highlight User3  gui=bold guifg=#ff99ff guibg=#7777c0
highlight User4  gui=bold guifg=#ff6699 guibg=#7777c0

" bookmarks
highlight Cream_ShowMarksHL ctermfg=blue ctermbg=lightblue cterm=bold gui=BOLD guifg=#ff60ff guibg=#383848

" spell check
highlight BadWord ctermfg=black ctermbg=lightblue gui=NONE guifg=White guibg=#aa3366

" current line
highlight CurrentLine term=reverse ctermbg=0 ctermfg=14 gui=none guibg=#585868

" email
highlight EQuote1 guifg=#ccccff
highlight EQuote2 guifg=#9999ff
highlight EQuote3 guifg=#3333ff
highlight Sig guifg=#999999

"+++

