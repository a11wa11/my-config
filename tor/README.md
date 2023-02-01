# Torを使ったテストツール

## 概要

本ディレクトリではTorネットワークを使って対象のURIへアクセスするためのファイルが保管されています。  
基本的にDockerだけで完結したテストツールになります。dockerが使用できる環境でお試しください。

## 使い方

* Torネットワークを使ってアクセステスト

```sh
$ pwd
/XXX/my-config/tor/access_with_Tor

# イメージ作成
docker build -t tor_image -f .dockerfiles/Dockerfile .dockerfiles --no-cache
# コンテナ起動
docker run --rm -d --privileged -it --name tor_container tor_image /sbin/init
# アクセステスト
docker exec -it tor_container python3 /root/access_with_Tor.py https://ja.wikipedia.org/wiki/(アクセスしたい任意のURI)

target URI -> (引数で指定した対象のURIが表示される)

Torネットワークを使用しますか？ [y/n] --> y (Torを使うならy,　使用しないならnを入力)

You are using tor.                   <- Torを使っているかどうか
Current IP address is XXX.XXX.XXX.XXX <- 現在のグローバルIPアドレスが表示
[result] Access is denied            <- 対象のURIへのアクセス結果

# ↑この内容が20秒ごとに延々とアクセスし続けますので停止したいときは Ctl + C で停めてください。

```

* Torネットワークを使い終わった際のコンテナの停止

```sh
docker stop tor_container
docker rm tor_container  # コンテナ起動時に--rmオプションを指定しなかった場合
docker rmi tor_image     # イメージ廃棄までする場合 
```

* 手動でTorネットワーク使いたい場合

```sh
docker build -t tor_image -f .dockerfiles/Dockerfile .dockerfiles --no-cache
docker run --rm -d --privileged -it --name tor_container tor_image /sbin/init
docker exec -it tor_container bash  
# コンテナ内でTorが使用可能

# Torを使いたい時のcurlコマンド
bash-4.2# curl -Lx socks5h://localhost:9050 http://httpbin.org/ip
# Torを使用しない時はオプション不要
bash-4.2# curl http://httpbin.org/ip

# TorのIPv4リストを手動で取得する
curl -s https://github.com/SecOps-Institute/Tor-IP-Addresses/blob/master/tor-exit-nodes.lst | grep '<td id="LC' | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' -o
# TorのIPv4リストを手動で取得する(末尾に[/32]とサブネットマスクを追加する)
curl -s https://github.com/SecOps-Institute/Tor-IP-Addresses/blob/master/tor-exit-nodes.lst | grep '<td id="LC' | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' -o | sed -e 's/$/\/32/g'

# TorのIPv6リストを手動で取得する
curl -s https://github.com/SecOps-Institute/Tor-IP-Addresses/blob/master/tor-exit-nodes.lst | grep '<td id="LC' | grep -v -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -Eo .{4}:.{4}:.{4}:.{4}:.{4}:.{4}:.{4}:.{4}
# TorのIPv6リストを手動で取得する(末尾に[/128]とサブネットマスクを追加する)
curl -s https://github.com/SecOps-Institute/Tor-IP-Addresses/blob/master/tor-exit-nodes.lst | grep '<td id="LC' | grep -v -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -Eo .{4}:.{4}:.{4}:.{4}:.{4}:.{4}:.{4}:.{4} | sed -e "s/$/\/128/g"
```

## GUIでTorブラウザ使用したい

```sh
# brewでインストール可能
brew install tor-browser
```
