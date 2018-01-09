set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim'

Plugin 'tpope/vim-fugitive'

Plugin 'kien/rainbow_parentheses.vim'
Plugin 'clojure-emacs/cider-nrepl'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-highlight'

Plugin 'pangloss/vim-javascript'

call vundle#end()

filetype plugin indent on
syntax on

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

" Use https://draculatheme.com
color dracula

" JavaScript configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1

" Auto-reload modified files with no local changes
set autoread

" Turn off backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Spaces not tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Commands for tab conversion
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

" Show line numbers
set number

" Show status line
set laststatus=2

" Show some useful information in the status line
set statusline=%F\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P

" Fix long lines causing pattern matching OOM errors
set maxmempattern=32768

" Clojure is Clojure
autocmd BufRead,BufNewFile *.clj setfiletype clojure
autocmd BufRead,BufNewFile *.cljs setfiletype clojure
autocmd BufRead,BufNewFile *.boot setfiletype clojure
autocmd BufRead,BufNewFile *.edn setfiletype clojure
