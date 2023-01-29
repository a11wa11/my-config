# 概要

ansibleの練習用のディレクトリ

## ansibleの基本機能や使い方は[こちらを参照](https://a11wa11.github.io/memo/IaC/01_ansible)

## ansibleの設定ファイル

* ansibleの設定ファイル`(ansible.cfg)`で主に以下の内容を実行時に定義する

1. inventory: インベントリファイルの場所。これにより`ansible-playbook setup_centos.yml`とインベントリパスの引数を省略可能
1. host_key_checking: ansibleはsshで遠隔操作するため、都度ssh接続時の鍵認証問い合わせを省略する
1. log_path: ansible実行時のログを記録するパス

## ansible実行前の準備

* 対象のサーバにsshできるように以下を実行

```sh
ssh-copy-id root@localhost -p ポート番号
```

## ansible実行コマンド

```sh
ansible-playbook -i hosts setup_centos.yml

# インベントリファイルを指定せず、直接ホストを指定する場合はカンマをつける
ansible-playbook -i cent7, setup_centos.yml
```

## 確認コマンド

```sh
# インベントリの構成確認
ansible-inventory -i hosts --list --yaml
```
