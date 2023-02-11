#!/bin/bash

# 確認コマンドをスキップするかどうか
if [[ $2 = "-f" ]] || [[ $2 = "--force" ]]; then
    YN="y"
else
    echo;
    read -p "Please select Yes or No [y/n]: " YN
fi

# 確認コマンド
case $YN in
    [Yy]|[Yy][Ee][Ss])
        echo;
        echo "selected yes"
        ;;
    [Nn]|[Nn][Oo])
        echo;
        echo "selected no"
        exit 1
        ;;
    *)
        echo;
        echo "No answer. Please enter your answer"
        exit 1
        ;;
esac
