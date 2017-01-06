" Automatically load ~/.vim/bundle plugin, syntax and colorscheme files with
" pathogen
filetype off
call pathogen#helptags()
call pathogen#infect('bundle/{}')

filetype plugin on
filetype indent on
syntax on

let mapleader = ','

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Auto-reload modified files (with no local changes)
set autoread

" Turn off backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Spaces not tabs
set tabstop=2
set shiftwidth=2
set expandtab

command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Remove trailing whitespace whenever saving files
if has("autocmd")
  au BufWritePre * :%s/\s\+$//e
endif

" Incremental search
set incsearch

" Smart case matching
set smartcase

" Show matching brackets
set showmatch

" Always show line numbers
set number

" Always show status line
set laststatus=2

" Let's see some useful info in the status line
set statusline=%F\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P

" Use a dark background
set background=dark

" Use solarized colorscheme
colorscheme candyman

" Fix long lines causing pattern matching OOM errors
set maxmempattern=32768

" Highlight long lines
highlight rightMargin ctermfg=lightblue
match rightMargin /.\%>79v/

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
"
" src: http://vim.wikia.com/wiki/Modeline_magic
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d filetype=%s :",
        \ &tabstop, &shiftwidth, &textwidth, &filetype)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" ES6 is JavaScript
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" Clojure is Clojure
autocmd BufRead,BufNewFile *.clj setfiletype clojure
autocmd BufRead,BufNewFile *.cljs setfiletype clojure
autocmd BufRead,BufNewFile *.boot setfiletype clojure
autocmd BufRead,BufNewFile *.edn setfiletype clojure

" vim: set ts=2 sw=2 tw=78 filetype=vim :
