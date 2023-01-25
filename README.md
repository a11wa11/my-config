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

## Makefile

* 書き方

```Makefile
# 基本的な記載の仕方
プログラム名: ソースファイル(省略可)
  ビルドのためのコマンドライン # 必ず行頭はタブでなければいけない

    # 以下代表的な記載例
  @ls -l           # @をコマンドの先頭につけるとコマンド内容が出力されない（実行結果は出力される）
  make 別ターゲット  # 別タスクを呼ぶことはできる
  -rm test         # コマンドの前に `-` をつけることでエラーになっても無視されて次に移る
  $@               # ターゲット名を表す変数

.PHONY: ターゲット名   # ターゲットはファイルは生成しないという事を明示する。複数指定可。
                     ※ターゲット名と同じファイルが存在していたときにmakeコマンドが実行されなくなるため。
.PHONY: all          # allというターゲットはファイルなしと明示
all: ;               # all は何も実行しないということになり、誤動作も防止することができる
```

* 実行コマンド

```sh
make ターゲット        # 指定したターゲット内容を実行する
make                 # ターゲットを指定しなければ一番最初に記載のあるターゲットが自動で実行される
make -n              # ターゲットを内容を実行せずに出力（デバッグ）
```

* 定義したdockerイメージを立ち上げ、コンテナ起動まで実行する

```sh
make docker_begin
```
