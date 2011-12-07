" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" -----------------------------------------------------------------------------  

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" original repos on github
Bundle 'tpope/vim-fugitive'
" Bundle 'msanders/snipmate.vim'
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'sontek/rope-vim'
Bundle 'rygwdn/rope-omni'
Bundle 'tpope/vim-surround'
" Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/tComment'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'altercation/vim-colors-solarized'
" Bundle 'fholgado/minibufexpl.vim'
" vim-scripts repos
"Bundle 'pylint.vim'
Bundle 'L9'
" Bundle 'FuzzyFinder'
" Bundle 'buftabs
Bundle 'rails.vim'
Bundle 'taglist.vim'
Bundle 'pyflakes.vim'
" Bundle 'PySmell'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex', {'rtp': 'vimfiles/'}

filetype plugin indent on

"Command T Esc Binding
let g:CommandTCancelMap='<Esc>'
let g:CommandTMaxHeight=10
nmap <silent> <Leader>l :CommandT<CR>
nmap <silent> <Leader>p :CommandTBuffer<CR>

set shiftwidth=2
"Restores the last cursor position
" VimTip 80: Restore cursor to file position in previous editing session
" for unix/linux/solaris
set nosol
set viminfo='10,\"100,:20,%,n~/.viminfo

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"
" Number of spaces to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: 8 spaces (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead *.c,*.h set shiftwidth=8
au BufNewFile *.c,*.h set shiftwidth=4

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
" Python: 4
" C: 4
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" Replace tabs with the equivalent number of spaces.
" Also have an autocmd for Makefiles since they require hard tabs.
" Python: yes
" C: no
" Makefile: no
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.c,*.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab


" Wrap text after a certain number of characters
" Python: 120
" C: 120
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=120

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
" au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
" au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" The following section contains suggested settings.  While in no way required
" to meet coding standards, they are helpful.

" Set the default file encoding to UTF-8: 
" set encoding=utf-8

" removes statusbar
set laststatus=2
" Puts a marker at the beginning of the file to differentiate between UTF and
" UCS encoding (WARNING: can trick shells into thinking a text file is actually
" a binary file when executing the text file): ``set bomb``

" Keep indentation level from previous line: 
set autoindent
" Set title in titlebar
set title 
set titlestring=%t%(\ %M%)%=%{expand(\"%:~:h\")}\/%(\ %a%)
set titlelen=40
" Disable read-only protection
" set modifiable

" Set messages shorter to avoid 'Press ENTER to continue' message because the
" line is too long
set shortmess=a

" Persistent undo
set undodir=/tmp/
set undofile

"---------------------------------------------------------------------
" Python IDE related staff
"---------------------------------------------------------------------

" highlight variable under cursor (not smart)
" Python: yes
" C: yes

"au BufRead,BufNewFile *.py,*.pyw,*.c  autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))

" Folding based on indentation:
set foldmethod=indent
" Display column on the left of size =1 to indictae folds on the left
set foldcolumn=1

"---------------------------------------------------------------------
" File formats support 
"---------------------------------------------------------------------

" Json
au! BufRead,BufNewFile *.json setfiletype json

" Show full tags when doing search completion
set showfulltag

" Speed up macros
set lazyredraw

" Include $HOME in cdpath
let &cdpath=','.expand("$HOME")

" Disable backup files
" set noswapfile
" set nobackup

set clipboard=unnamed
" Set mouse mod
set mouse=a
set mousemodel=popup

" Try to show at least three lines and two columns of context when
" scrolling
set scrolloff=3
set sidescroll=3
set sidescrolloff=3

" Allow edit buffers to be hidden
set hidden
" 1 height windows
set winminheight=1

" Wrap on these
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set whichwrap+=<,>,[,]

" Use '-' for folds
set fillchars=fold:-

" Use the cool tab complete menu
" Ignore certain filetypes in listings
set wildmenu
set wildignore+=*.o,*.obj,.git,*.vtr,*.vtu,*.vtk,*.bmp,*.aux,*.pdf,*.ps,*~,*.dvi,*.toc,*.bbl,*.blg

" -------------------------------------------------------------------------------
"  LaTeX files related
" -------------------------------------------------------------------------------
" Set default filetype of tex documents to tex to ensure latex-suite is loaded
let g:tex_flavor='latex'
autocmd FileType tex set wildignore+=*.o,*.obj,.git,*.vtr,*.vtu,*.vtk,*.bmp,*.aux,*.pdf,*.ps,*~,*.dvi,*.toc,*.bbl,*.blg,*.log,*.brf,*.out,*.fdb_latexmk
autocmd FileType tex set shiftwidth=2

" autocmd FileType tex set iskeyword+=.,:
au BufRead,BufNewFile *.tex set iskeyword+=:,.
" Set default keymapping to fix press ENTER issue
"add <cr> to vim-latex/vimfiles/compiler.vim Tex_Compile mapping
" -------------------------------------------------------------------------------

" Spellchecking, toggle using F4*********************************************

function! ToggleSpell()
    if !exists("b:spell")
        setlocal spell spelllang=en_us
        let b:spell = 1
    else
        setlocal nospell
        unlet b:spell
    endif
endfunction
" Rope AutoComplete
let ropevim_vim_completion=1
" let ropevim_extended_complete=1
" let g:ropevim_autoimport_modules=["os.*","traceback","django.*","lxml.etree","lxml.*","scipy"]
" imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>

nmap <silent> <F4> :call ToggleSpell()<CR>
imap <silent> <F4> <Esc>:call ToggleSpell()<CR>a
" Navigation use Ctrl - hjkl  key to switch split windows*****************
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
noremap <silent> <S-h> :bprevious<CR>
noremap <silent> <S-l> :bnext<CR>
noremap § ``
:ca WQ wq
:ca W w
:ca X x
:ca Q q
"Press space to alternate between Unfold and Fold
nnoremap <Space> za
map <leader>c <c-_><c-_>
map <leader>\ :e#<CR>
" map <esc><Space> gcc
" inoremap <Nul> <C-x><C-o>
" Indenting *******************************************************************
" set ai " Automatically set the indent of a new line (local to buffer)
" set si " smartindent	(local to buffer)

" Python Stuff ****************************************************************

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

"map <C-h> :py EvaluateCurrentRange()


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>


" Cursor highlights ***********************************************************
"set cursorline
"set cursorcolumn

"HIghlighting of trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase, needs ignorecase set


" Colors **********************************************************************
"set t_Co=256 " 256 colors
"set background=dark 
syntax on " syntax highlighting
" For full syntax highlighting:
" python_highlight_all displays bad whitespaces
" Use the below highlight group when displaying bad whitespace is desired
" highlight BadWhitespace ctermbg=red guisp=red gui=undercurl guifg=NONE guibg=NONE

" Display tabs at the beginning of a line in Python mode as bad.
" au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
" Select colormap: 'soft', 'softlight', 'standard' or 'allblue'
"let xterm16_colormap    = 'soft'

" Select brightness: 'low', 'med', 'high', 'default' or custom levels.
"let xterm16_brightness  = 'default'

"colo xterm16
"colorscheme ir_black
colorscheme solarized
set background=dark


" Status Line *****************************************************************
"set showcmd
"set ch=2 " Make command line two lines high
if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

"Always display Cursor position in lower right
set ruler

" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word

" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h

" Insert New Line **************************************************************

nnoremap <Enter> :set paste<CR>m`O<Esc>``:set nopaste<CR>
"set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)

"Press Ctrl-a in insert or visual mode to toggle paste mode (good for indented
"code)
set pastetoggle=<C-a>
"Make the timeout between command key presses shorter (default 1000millisec)
"so <Shift-O> opens a newline above cursor more quickly
set timeoutlen=300

" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" Misc ************************************************************************
set number " Show line numbers
set numberwidth=1 "Set minimal width of Number Column to the left
set backspace=indent,eol,start
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how


" Invisible characters  and Wrapping *******************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
noremap ,i :set list!<CR> " Toggle invisible chars
noremap ,w :set wrap!<CR>  " Toggle Text wrapping

" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" Ruby stuff ******************************************************************
"compiler ruby         " Enable compiler support for ruby
"map <F5> :!ruby %<CR>

"---------------------------------------------------------------------
" completion
"---------------------------------------------------------------------

"by tags
" set dictionary=/usr/share/dict/words
" let g:showfuncctagsbin="/usr/bin/ctags"

" by pydict
" let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict' 

" Omni Completion *************************************************************
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=RopeCompleteFunc
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible()==0|pclose|endif
autocmd InsertLeave * if pumvisible()==0|pclose|endif

" May require ruby compiled in

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 

"Supertab default completion
let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest
let g:SuperTabLongestEnhanced=1

" --------- Ctags
nnoremap <silent> <F9> :TlistToggle<CR>
" show list on the rightmost side of the window
let Tlist_Use_Right_Window=1
" remove empty lines
let Tlist_Compact_Format=1
" show Tlist menu in gVim
let Tlist_Show_Menu=1 

""" --------- Pylint
"autocmd FileType python compiler pylint
"" Don't show quickfix window. Manually can be opened by :cope
"let g:pylint_cwindow = 0
"" Don't show style errors
"let g:pylint_conventions = 1
"" Check file 'on fly'
"let g:pylint_onfly = 1

" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  

"" NERDTree ********************************************************************
" noremap <silent> <F7> :NERDTreeToggle<CR>
noremap <silent> <leader>n :NERDTreeToggle<CR>
"" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1
let NERDTreeWinPos='right'
"
"" Single click for everything
"let NERDTreeMouseMode=1
" Trinity ******************************************************************
" Open and close all the three plugins on the same time
"nmap <F8>   :TrinityToggleAll<CR>
"
"" Open and close the srcexpl.vim separately
"nmap <F9>   :TrinityToggleSourceExplorer<CR>
"
"" Open and close the taglist.vim separately
"nmap <F10>  :TrinityToggleTagList<CR>
"
"" Open and close the NERD_tree.vim separately
"nmap <F11>  :TrinityToggleNERDTree<CR>
"
" SnippetsEmu *****************************************************************
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.


" fuzzyfinder_textmate ********************************************************
"map ,f :FuzzyFinderFile<CR>
"map ,b :FuzzyFinderBuffer<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 2

" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  

" Mac *************************************************************************
if has("mac") 
	let &t_SI="\<Esc>]50;CursorShape=1\x7" 
	let &t_EI="\<Esc>]50;CursorShape=0\x7"
endif
 
" Windows *********************************************************************
"if has("gui_win32")
  "" 
"endif


" -----------------------------------------------------------------------------  
" |                               Startup                                     |
" -----------------------------------------------------------------------------  
" Open NERDTree on start
"autocmd VimEnter * exe 'NERDTree' | wincmd l 

" -----------------------------------------------------------------------------  
" |                               Host specific                               |
" -----------------------------------------------------------------------------  
" if filereadable(expand("~/.vimrc.local"))
"   source ~/.vimrc.local
" endif
