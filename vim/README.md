# vimの設定

## .vimrcの紐付け

```sh
ln -snf $(pwd)/vimrc ~/.vimrc
```

## vim-plugの使用法

1. vim-plug　を下記のコマンドでインストール

[参考](https://github.com/junegunn/vim-plug/wiki/tutorial)

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```  

2. `.vimrc`ファイル使用時に下記のコマンドでインストール

```sh
:PlugInstall
```

※削除したい時は↓

```sh
:PlugClean
```

## 折畳みコマンド

```sh
zo    #カーソル下の折り畳みを一段階開く
zO    #カーソル下の折り畳みを全て開く
zc    #カーソル下の折り畳みを一段階閉じる
zC    #カーソル下の折り畳みを全て閉じる
zm    #折り畳み全てを一段階開く
zM    #折り畳み全てを開く
zr    #折り畳み全てを一段階閉じる
zR    #折り畳み全てを閉じる
```

## 別ファイルの開き方

```sh
:vs file_name    #垂直分割してファイルを開く
:sp file_name    #水平分割してファイルを開く
:e file_name     #現画面でファイルを開く
:tabe file_name  #新しいタブでファイルを開く
```

* 手動で複数行コメントアウトしたいとき
  * Ctl + v でコメントアウトしたい行を矩形選択
  * Shift + i の挿入モードで`#`を入力し
  * escを押下
