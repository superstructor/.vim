set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim'

call vundle#end()

filetype plugin indent on
syntax on

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
