.vim
=====

This is my .vimrc and associated plugins, syntax files and colorschemes that I use. Here more for my personal convenience than anything else.

If your interested feel free use it without restriction as long as you comply with the licenses of the included submodules. You will probably want to make modifications to suit your editing preferences and requirements.

Everything is loaded via the awesome pathogen plugin from ~/.vim/bundle Pathogen is loaded via ~/.vim/autoload/pathogen

~/.vim/bundle symlinks to git submodules in ~/.vim/submodule where a git repository is available. Otherwise files are stored in the repo itself.

Setup
------

Clone into ~/.vim

    cd ~ && git clone https://github.com/superstructor/.vim

Get the GIT submodules

    cd ~/.vim && git submodule init && git submodule update

Link ~/.vimrc to ~/.vim/vimrc

    cd ~ && ln -sv ~/.vim/vimrc .vimrc

Compile C extension for command-t plugin

    cd ~/.vim/submodule/commandt/ruby/command-t && ruby extconf.rb && make
