" vim:foldmethod=marker


" good for debugging where a value is set
" :verbose set cindent?

" init pathogen
execute pathogen#infect()
call pathogen#helptags()

set nocompatible
" autoload .vimrc on save
autocmd! bufwritepost .vimrc source %

" Init {{{1


colorscheme koehler

" syntax highlighting
syntax on

" highlight current line
set cursorline

" virtual edit=block allows selection part the end on the line
set virtualedit=block

set backspace=indent,eol,start

" when changing stuff place the $ symbol at the end of the selection
set cpoptions+=$

" how many columns to display for fold information
set foldcolumn=3

" allow for buffers to be hidden
set hidden

" }}}

" Status line {{{1
set statusline=
set statusline+=%7*\[%n]                             " buffernr
set statusline+=%1*\ %<%F\                           " File+path
set statusline+=%2*\ %y\                             " FileType
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\       " Encoding2
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''} " Encoding
set statusline+=%4*\ %{&ff}\                         " FileFormat (dos/unix..)
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\        " Rownumber/total (%)
set statusline+=%9*\ col:%03c\                       " Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                 " Modified? Readonly? Top/bot.
set statusline+=\ [A=\%03.3b/H=\%02.2B]              " ASCII / Hexadecimal value of char

hi User1 ctermfg=Red ctermbg=Blue
hi User2 ctermfg=Darkblue ctermbg=Gray
hi User3 ctermfg=Gray ctermbg=Blue
hi User4 ctermfg=Black ctermbg=Red
hi User5 ctermfg=Green ctermbg=Red
hi User7 ctermfg=Black ctermbg=Green
hi User8 ctermfg=Black ctermbg=Gray
hi User9 ctermfg=Green ctermbg=Blue
hi NonText ctermfg=7 guifg=gray

" }}}

" Dictionary setup {{{1
" word completion, C-X C-K to display matches
set dictionary+=/usr/share/dict/words.pre-dictionaries-common
" search for alternative words, C-X C-T to display matches
" set thesaurus+=/usr/share/dict/mthesaur

" }}}

" Special chars {{{1
" don't display special chars
set nolist
" show the following chars
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" visualize tabs
" syntax match Tab /\t/
" hi Tab gui=underline guifg=blue ctermbg=blue 

" }}}

" Stuff {{{1
set tabstop=8                                                     " a tab is 4 spaces
set softtabstop=8                                                 " backspace deletes 4 spaces
set shiftwidth=8                                                  " spaces for auto indents
set noexpandtab                                                   " use tabs instead of spaces
set scrolloff=6                                                   " show 2 lines below/above the cursor
set number                                                        " show line numbers
set showmatch                                                     " Show matching brackets when text indicator is over them
set ruler                                                         " show cursor position in status bar
set title                                                         " show file in title bar
set wildmenu                                                      " completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html

set nospell
set hlsearch
set incsearch                                                     " Make search act like search in modern browsers

set esckeys                                                       " map missed escape sequences (enables keypad keys)
set ignorecase                                                    " case insensitive searching
set smartcase                                                     " but become case sensitive if you type uppercase characters
set smartindent                                                   " smart auto indenting
set smarttab                                                      " smart tab handling for indenting
set magic                                                         " change the way backslashes are used in search patterns
set bs=indent,eol,start                                           " Allow backspacing over everything in insert mode)
set wrap                                                          " wrap long lines
set linebreak                                                     " don't break words when wrapping text
set showbreak=¬                                                   " ¬ is added in front of the soft lines when using line break

set fileformat=unix						  " file type Unix 
set foldmethod=manual						  " use manual fold method

set diffopt=filler,icase,vertical				  " diffsplit settings : do - Get changes from other window into the current window; dp - Put the changes from current window into the other window; :diffsplit

" }}}

" Maps {{{1
" remap mapleader to ,
let mapleader = ","

" clear search
nmap <silent> ,/ :nohlsearch<CR>

" forgot to sudo first?
cmap w!! w !sudo tee % >/dev/null

" open .vimrc
nnoremap <Leader>e :vsp $MYVIMRC<CR>

" %% -> $(basename %)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Maps for jj to act as Esc
inoremap jj <esc>
cnoremap jj <c-c>

" filter results in command history
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" easier split navigation
nnoremap <c-h> 5<c-w><
nnoremap <c-l> 5<c-w>>

" space to open/close fold
nnoremap <space> za

" insert mode calculator C-C
inoremap <C-C> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" insert mode navigation
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" easier tab nagigation
nnoremap <left> :tabprevious<CR>
nnoremap <right> :tabnext<CR>
nnoremap <up> :tabfirst<CR>
nnoremap <down> :tablast<CR>

" Bubble single lines. Use temporary register m
nmap <C-k> "mddk"mP
nmap <C-j> "mdd"mp
" Bubble multiple lines. Use temporary register n
vmap <C-k> "nxk"nP`[V`]
vmap <C-j> "nx"np`[V`]

" visual indent. keep the selection
vnoremap < <gv
vnoremap > >gv

" visual mode sort
vnoremap <Leader>s :sort<CR>

" take notes
" open the notes dir
nnoremap <Leader>nn :vsp ~/notes/
" save the current visual selection
vnoremap <Leader>nn "ny :vsp ~/notes/
iabb	--- --------------------------------------------------------------------------------<CR>
iabb	*** ********************************************************************************<CR>

" autocomplete (, [, {

" inoremap ( ()<Left>
" inoremap [ []<Left>
" inoremap { {}<Left>
" 
" vnoremap ( s()<Esc>P
" vnoremap [ s[]<Esc>P
" vnoremap { s{}<Esc>P

"-------------------------------------------------------------------------------
" autocomplete quotes
"-------------------------------------------------------------------------------

" vnoremap  '  s''<Esc>P<Right>
" vnoremap  "  s""<Esc>P<Right>
" vnoremap  `  s``<Esc>P<Right>
" 
" inoremap  '  '<Esc>:call QuoteInsertionWrapper("'")<CR>a
" inoremap  "  "<Esc>:call QuoteInsertionWrapper('"')<CR>a
" inoremap  `  `<Esc>:call QuoteInsertionWrapper('`')<CR>a

"-------------------------------------------------------------------------------
" Add a second quote only if the left and the right character are not keyword
" characters.
"-------------------------------------------------------------------------------

" function! QuoteInsertionWrapper (quote)
" let     col     = col('.')
" if getline('.')[col-2] !~ '\k' && getline('.')[col] !~ '\k'
" 		normal ax
" 		exe "normal r".a:quote."h"
" end
" endfunction    " ----------  end of function QuoteInsertionWrapper  ----------

" }}}

" Plugins {{{1
" active plugins
filetype plugin on

" change mapleader for bash plugin
let g:BASH_MapLeader = ','
let g:BASH_DoOnNewLine = 'yes'


" Only do this part when compiled with support for autocommands
if has("autocmd")
	func! Autoindentbash()
		exe "normal gg=G"
	endfunc
	" Syntax of these languages is fussy over tabs Vs spaces

"	autocmd FileType sh :call Autoindentbash()
	
endif

" Map key to toggle opt
if !exists("MapToggle")
	function! MapToggle(key, opt)
		let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
		exec 'nnoremap '.a:key.' '.cmd
		exec 'inoremap '.a:key." \<C-O>".cmd
	endfunction
endif
command! -nargs=+ MapToggle call MapToggle(<f-args>)

" load the plugins
runtime! plugin/*.vim

" Tabularize plugin example : Tabularize /<pattern>
" \a= will run Tabularize \=
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:<CR>
	vmap <Leader>a: :Tabularize /:<CR>
	nmap <Leader>a" :Tabularize /"<CR>
	vmap <Leader>a" :Tabularize /"<CR>
	nmap <Leader>a<bar> :Tabularize /<bar><CR>
	vmap <Leader>a<bar> :Tabularize /<bar><CR>
	nmap <Leader>a, :Tabularize /,<CR>
	vmap <Leader>a, :Tabularize /,<CR>
	nmap <Leader>a# :Tabularize /#<CR>
	vmap <Leader>a# :Tabularize /#<CR>
endif

" taglist plugin
let $Tlist_Ctags_Cmd='/usr/bin/ctags'

" tasklist plugin keywords : ,t to open
let g:tlTokenList = ['TODO', 'BUG', 'FIXME']

" Calendar plugin
" week starts on Monday
let g:calendar_monday = 1
" week number format
let g:calendar_weeknm = 2 " WK 1

" Shortcuts {{{2

" undo history browser
nnoremap <F5> :GundoToggle<CR>
" set/unset paste mode
MapToggle <F12> paste
" show/hide special chars
MapToggle <F11> list
" toggle scroll "locking" of other windows
MapToggle <F10> scrollbind

" toggle tag list
nnoremap <F6> :TlistToggle<CR>

" shortcut to toggle spelling
nmap <F2> :setlocal spell! spelllang=en_us<CR>

" Localize plugin, :L

	" }}}
" }}}