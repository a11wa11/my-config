#!/bin/bash

if [[ -z $ENVIRONMENT ]]; then
    echo;
    echo "環境を以下から数字で選択してください"
    select ENVIRONMENT in Test Dev Stg Prd
    do
        if [[ -z $ENVIRONMENT ]]; then
            echo;
            echo "選択肢の中から環境を選択してください"
            exit 1
        else
            echo;
            echo "$ENVIRONMENT環境で実行します"
            break
        fi
    done
fi

if [ $ENVIRONMENT = 'Prd' ]; then
    echo;
    read -p "本当によろしいですか?? [y/n]: " YN
    # 本番環境実行なら確認
    case $YN in
        [Yy]|[Yy][Ee][Ss])
            echo;
            echo "Run in production."
            ;;
        [Nn]|[Nn][Oo])
            echo;
            echo "Stop execution in the production environment."
            exit 1
            ;;
        *)
            echo;
            echo "No answer. Please enter your answer"
            exit 1
            ;;
    esac
fi