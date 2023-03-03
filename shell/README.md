# 自作シェルなんか

* カレンとディレクトリの全てのファイルの中身をファイル名と一緒に表示する

```sh
files=$(ls); for file in $files; do echo "$file を表示します"; cat $file; echo; echo; done
```
