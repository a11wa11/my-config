# my-configについて

* よく使うツールの構成・設定内容を保存しています。

## bash

* `bashrc`に自分の好みの設定を残しています。

## git

* `gitconfig`,　`gitignore_global`に自分の好みの設定を残しています。

## vim

* `vimrc`に自分の好みの設定を残しています。

## PCの初期セットアップなどの際

* 下記を使用してください

```sh
sh initial.sh
```

## 既存の内容を最新にしたい場合

* 下記を使用してください

```sh
sh setting.sh
```

## docker

```sh
# ビルド
docker build -t ansible . --no-cache
# コンテナ起動 ※どちらも同じ
docker run -d --rm -v $(pwd)/ansible:/home/ec2-user/workdir --name al2 ansible
docker run -d --rm --mount type=bind,src=$(pwd)/ansible,dst=/home/ec2-user/workdir --name al2 ansible /sbin/init
# コンテナアタッチ
docker exec -it al2 bash
```

* 定義したdockerイメージを立ち上げ、コンテナ起動まで実行する

```sh
make docker_begin
```
