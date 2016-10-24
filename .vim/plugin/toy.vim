function! CurDir()
  let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
  return curdir
endfunction

function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! Do_CsTag()
	" go to here /net/ecngzux011/localdisk/view_store/ehezhen
    let workdir = "/opt/hadoop/src"  "hadoop
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    "if(has("cscope") )
        if(g:iswindows!=1)
            "silent! execute "!find ".workdir."  -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.s' -o -name '*.cxx' -o -name 'lost+found' -prune -type f | grep -v bootloader > cscope.files"
            "silent! execute "!find ".getcwd()."  -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.s' -o -name '*.cxx' -type f > cscope.files"
            "silent! execute "!find ".getcwd()."  -name '*.java' -o -name '*.py' -o name '*.xml' -type f > cscope.files"
            silent! execute "!find ".getcwd()." -name '*.js' -o -name '*.scss' -o -name 'node_modules' -prune -type f  >> cscope.files"
            silent! execute "!find ".getcwd()." -name '*.java' -o -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name 'node_modules' -prune -type f  >> cscope.files"
            silent! execute "!cscope -bkq -i cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
            silent! execute "!cscope -b"
        endif
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    "endif
    if(executable('ctags'))
        "silent! execute --c++-kinds=+p"!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -L cscope.files"
        silent! execute "set tags=".getcwd()."/tags"
    endif
    if(g:iswindows!=1)
        silent! execute '!sort cscope.files > filenametags'
    else
    	silent! execute '!findu '.getcwd().' ( -name "*.s" -o -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "Makefile" ) -printf "\%f\t\%p\t1\n"  | sort > filenametags '
    endif

silent! execute '!echo "set tags='.getcwd().'/tags" > script.vim'
silent! execute '!echo "cs add '.getcwd().'/cscope.out" >> script.vim'
silent! execute '!echo "nmap <F5> <ESC>:e '.getcwd().'/cscope.files<CR>" >> script.vim'
silent! execute '!echo "nmap <F12> <ESC>:bwipe<CR>:Project '.getcwd().'/projectfiles<CR>" >> script.vim'


    "jexecute "normal :"
    "jlet curdir = substitute(getcwd(), '\\', '/', "g")
    "jsilent! execute "let g:LookupFile_TagExpr = '".'"'.curdir."/filenametags".'"'."'"
endfunction

