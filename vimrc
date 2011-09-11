" Automatically load ~/.vim/bundle plugin, syntax and colorscheme files with
" pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin on
filetype indent on

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
colorscheme neopro

" Riak configs are erlang
if has("autocmd")
  au BufNewFile,BufRead /etc/riak/* setf erlang
endif

" Fix long lines causing pattern matching OOM errors
set maxmempattern=32768

" Allow modelines
set modeline

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
" vim: set ts=2 sw=2 tw=78 filetype=vim :
