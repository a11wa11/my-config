#!/bin/bash

# brewのアンインストール
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
# brewのインストール
# M1チップの場合は、「Rossetaを使用して開く」をターミナルに設定してから実行しないとHOME BREWはインストールできない
[ ! -e /usr/local/bin/brew ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# gitの初期設定
check_git_info () {
    git_name=`git config --get user.name`
    git_email=`git config --get user.email`
}

register_git_info () {
    target=$1
    target_jp=$2
    echo "Please input your ${target} on git."
    echo "〜gitの登録${target_jp}を入力してください〜"
    read -p ">>> " git_var
    git config --global user.${target} ${git_var}
    echo "   gitの登録${target_jp}は -> ${git_var} です"
}

check_git_info

[ ! ${git_name} ] && register_git_info "name" "名"
[ ! ${git_email} ] && register_git_info "email" "メール"

# ssh-keyの作成
if [ ! -e ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -C ${git_email} -f ~/.ssh/id_rsa
    # ssh-keyの公開鍵をgithubへ登録
    echo "\nPlese register your public-key in github settings.\n〜githubへ公開鍵を登録してください\n"
fi

# 初期設定するリポジトリをクローン
[ ! -e ~/my-config ] && git clone https://github.com/a11wa11/my-config.git ~/my-config
[ ! -e ~/.*shrc ] && sh ~/my-config/setting.sh
check_git_info
cp -f ~/my-config/git/gitconfig ~/.gitconfig
git config --global user.name ${git_name}
git config --global user.email ${git_email}

[ -e ~/my-config/mac/Brewfile ] && \
cd ~/my-config/mac && \
softwareupdate --install-rosetta && \
brew bundle
#sudo sed -ie 's/^#log_path = \var\/log\/ansible.log/log_path = \var\/tmp\/ansible.log/g' /etc/ansible/ansible.cfg
#sudo sed -ie 's/^#stdout_callback = skippy/#stdout_callback = skippy\nstdout_callback = counter_enabled/g' /etc/ansible/ansible.cfg
#brew install anyenv jq tree ansible@2.9
#brew install google-chrome brave-browser firefox
#brew install docker zoom discord
#brew install iterm2 cheatsheet
#brew install google-japanese-ime hyperswitch itsycal
#brew install mi visual-studio-code
