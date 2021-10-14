# 概要

ansibleの練習用のディレクトリ

## ansibleの設定ファイル

* ansibleの設定ファイル`(ansible.cfg)`で主に以下の内容を実行時に定義する

1. inventory: インベントリファイルの場所。これにより`ansible-playbook setup_centos.yml`とインベントリパスの引数を省略可能
1. host_key_checking: ansibleはsshで遠隔操作するため、都度ssh接続時の鍵認証問い合わせを省略する
1. log_path: ansible実行時のログを記録するパス

## ansible実行コマンド

```sh
ansible-playbook -i hosts setup_centos.yml
```