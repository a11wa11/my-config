#!/bin/bash
# git,bashrc,vimなどの設定を常に更新するためのシェルスクリプト
[ ! -e ~/.gitconfig  ] && cp $(pwd)/git/gitconfig ~/.gitconfig
[ ! -e ~/.gitignore_global  ] && ln -nsf $(pwd)/git/gitignore_global ~/.gitignore_global
[ ! -e ~/.vimrc  ] && ln -nsf $(pwd)/vim/vimrc ~/.vimrc
[ ! -e ~/.vim/autoload/ ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
  vim -c PlugInstall
[ $SHELL = '/bin/bash' ] && ln -nsf $(pwd)/shell/template_shrc ~/.bashrc
[ $SHELL = '/bin/zsh' ] && ln -nsf $(pwd)/shell/template_shrc ~/.zshrc
exec $SHELL -l
