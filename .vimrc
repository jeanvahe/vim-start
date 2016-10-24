"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set necessary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

"Get out of VI's compatible mode..
set nocompatible

"Set to auto read when a file is changed from the outside
set autoread

""anonymous" register is aliased to the * registe
set clipboard=unnamed
"set syntax=notes  <- make the VIM verfy slow to open a log file

"Enable filetype plugin
filetype plugin on
filetype indent on

syntax on
syntax enable

"Ignore case when searching
set ignorecase
set incsearch

" Sound disable
set noeb
set novb

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set vb t_vb=

"show matching bracets
set showmatch

"Turn on WiLd menu
set wildmenu "tab can complete command-line 

"Always show current position
set ruler " show line and column number of cursor position

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Wrap lines
set wrap

"when wrap a link, wrap in a break positin
set lbr

"Auto indent
set ai

"Tab
set expandtab
set shiftwidth=8
set tabstop=8
set smarttab
set expandtab

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Highlight current
set cursorline

"Highlight search things
set hlsearch

"all folds are open
set nofen

"change dir with open a file
"set autochdir

"fold by syntax
"set foldmethod=syntax
set foldmethod=indent
set fdo-=search

"textwidth, longer line will be broken
set tw=500

"Sets how many lines of history VIM har to remember
set history=400

"Turn backup off
set nowb      " backup file before overwriting file, if backup is on, will not delete bk file
set nobackup  " backup file before overwriting file
set noswapfile "create sawpfile of update

"Set the color scheme
colorscheme desert
"colorscheme koehler
set guifont=Consolas:h11
set guioptions-=T
set guioptions+=l
set fileencodings=utf-8
set termencoding=utf-8
"set fileformats=unix
set encoding=utf-8

"Set 7 lines to the curors - when moving vertical..
set so=7

"The commandbar is 2 high
set cmdheight=2

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"How many tenths of a second to blink
set mat=2

" complete menu, don't use menu and longest
set completeopt=

set previewheight=1

" don't complete from include and tags
set complete=.,w,b,u

" set path for find definition of vars
set path = path=.,/usr/include,,/home/rock/build/debug-install/include,/usr/include/c++/4.8,

"Always hide the statusline
set laststatus=2

"Format the statusline
set statusline=%f\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

set guitablabel=%N\ %t

set sessionoptions+=unix,slash

set viminfo='10,\"100,:20,%,n~/.viminfo

" folder to most levels
set fdl=0

"set ffs=dos,unix
set vb t_vb=
"set ff=unix
set ff=unix

set noet sw=4 ts=4 sts=4
nmap <leader>lc :set noet sw=4 ts=4 sts=4<cr>

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
map <leader>cd :cd %:p:h<cr>
map <leader>r <ESC>:e .<cr>
map <leader>d :call <SID>BufcloseCloseIt()<cr>
map <leader>ch <ESC><C-H>:close<cr>
map <leader>cl <ESC><C-L>:close<cr>
map <leader>ck <ESC><C-K>:close<cr>
map <leader>cj <ESC><C-J>:close<cr>
map <leader>a <C-^>
map <leader>v :source ./script.vim<cr>
map <leader>e :e! ~/.vimrc<cr>
map <leader><space> :w!<cr>:source %<cr>

vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"Map space to / and c-space to ?
map <space> /

"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
imap <M-j> <esc>mz:m+<cr>`zi
imap <M-k> <esc>mz:m-2<cr>`zi

"Map auto complete of (, ", ', [
inoremap (( ()<esc>:let leavechar=")"<cr>i
inoremap [[ []<esc>:let leavechar="]"<cr>i
inoremap "" ""<esc>:let leavechar='"'<cr>i
inoremap }} {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap {{ {}<esc>:let leavechar="}"<cr>i
inoremap << <><esc>:let leavechar=">"<cr>i
inoremap '' ''<esc>:let leavechar="'"<cr>i
inoremap <2 <<

"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
map <leader>1 :source /home/rock/tags/muduo/muduo.vim<cr>
map <leader>2 :source /home/rock/tags/cdap/cdap.vim<cr>
map <leader>3 :source /home/rock/tags/qxdmlyzer/qxdmlyzer.vim<cr>
map <leader>4 :source /home/rock/tags/mercury/mercury.vim<cr>
map <leader>5 :source /home/rock/tags/sip/sip.vim<cr>
map <leader>6 :source /home/rock/tags/mryapp/mryapp.vim<cr>
"map <leader>6 :source ~/share/vim/vim72/tags/vx69.vim<cr>
"map <leader>7 :source ~/share/vim/vim72/tags/vx69stack.vim<cr>
"map <leader>8 :source D:\Src\server1\configvim\vimconfig.vim<cr>
"map <leader>0 :source D:\Src\jeanvastoy\ds\vim\vimconfig.vim<cr>

nmap <F2> :call Do_CsTag()<cr>
nmap <F4> :close<CR>
nmap <F5> :cclose<CR><Plug>LookupFile
nmap <F6> <Plug>ToggleProject<ESC>:set vb t_vb=<CR>
"nmap <silent> <F7> :botright cw 8<CR><CR>
nmap <silent> <F9> :vs<CR><C-L>
nmap <F10> <ESC>:only<CR>
nmap <F8> <ESC>:BufExplorerVerticalSplit<CR>
"nmap <F8> <ESC><C-H><C-L>
nmap <F7> <ESC><leader>r

"nmap <F12> <ESC>:bwipe<CR>:Project $VIMRUNTIME/projectfiles<CR>

"Restore cursor to file position in previous editing session
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Go to the leaving postion
autocmd BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
autocmd BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

"Enable folding, I find it very useful
autocmd BufEnter * :syntax sync fromstart
autocmd BufEnter * :cd %:p:h


augroup filetypedetect
au BufNewFile,BufRead *.notes setf notes
au BufNewFile,BufRead *.scala setf scala
augroup END

" lookupfile 
"let g:LookupFile_PreserveLastPattern = 0        
"let g:LookupFile_PreservePatternHistory = 0
"let g:LookupFile_AlwaysAcceptFirst = 1          
"let g:LookupFile_AllowNewFiles = 0             
"let g:LookupFile_TagsExpandCamelCase = 0 
"nmap <leader>lb :LUBufs<cr>
"nmap <leader>lw :LUWalk<cr>

" Cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-,f-,g-
set csto=0  "cscope database searches first (no use at all now, -g can't work)
set cspc=2  "show 2 directories
set nocsverb
"set csprg=/home/ehezhen/bin/cscope

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR><ESC>:botright cw 8<CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR><ESC>:botright cw 8<CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR><ESC>:botright cw 8<CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR><ESC>:botright cw 8<CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR><ESC>:botright cw 8<CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR><ESC>:botright cw 8<CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR><ESC>:botright cw 8<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR><ESC>:botright cw 8<CR>

   
" Omni
"autocmd BufEnter *.cc,*.c,*.h call omni#cpp#complete#Init()
"  
"let OmniCpp_DefaultNamespaces = ["std", "Wm4"] " specify the default namespaces
"let OmniCpp_GlobalScopeSearch = 1    " enable global scope search
"let OmniCpp_NamespaceSearch = 2      " search namespaces in buffer and included files
"let OmniCpp_DisplayMode = 1          " show all member, include private
"let OmniCpp_ShowScopeInAbbr = 0      " put the scope at end
"let OmniCpp_ShowPrototypeInAbbr = 1  " don't display the prototype
"let OmniCpp_ShowAccess = 0           " hide access
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
  
" a
let g:alternateSearchPath='sfr:.'
let g:alternateNoDefaultAlternate = 1 "don't switch non-exist
let g:alternateRelativeFiles = 1

" project
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:proj_window_width = 16
let g:proj_window_increment = 16
let g:proj_flags = "imstc"
let g:proj_run_fold1="!mingw32-make -C %D"
let g:proj_run1="!%f"
let g:proj_run2="source %f"
nmap <F12> <ESC>:bwipe<CR>:Project ~/vim_project/projectfiles<CR>

" taglist
let g:Tlist_Show_One_File = 1
let s:tlist_def_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;' .
                           \ 'c:class;g:enum;s:struct;u:union;f:function;l:local'
let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 15
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_Compact_Format = 0

" authorInfo
"let g:vimrc_author='jeanvahe' 
"let g:vimrc_email='jeanvahe@gmail.com' 
"let g:vimrc_homepage='http://hi.baidu.com/6oo9' 
"
"nmap <leader>la :AuthorInfoDetect<cr> 

let $toy = "~/.vim/plugin/toy.vim"

"Tab
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab
"iab xSrc D:/Src
"!_TAG_FILE_SORTED	2	/2=foldcase/
"$F/wy$^Pa	A	1j
