set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim'

Plugin 'kien/rainbow_parentheses.vim'
Plugin 'clojure-emacs/cider-nrepl'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-highlight'

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

" Turn off backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Spaces not tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Always show status line
set laststatus=2

" Some useful information in the status line
set statusline=%F\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P

" Clojure is Clojure
autocmd BufRead,BufNewFile *.clj setfiletype clojure
autocmd BufRead,BufNewFile *.cljs setfiletype clojure
autocmd BufRead,BufNewFile *.boot setfiletype clojure
autocmd BufRead,BufNewFile *.edn setfiletype clojure
