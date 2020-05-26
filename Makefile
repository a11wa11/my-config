# http://urin.github.io/posts/2013/simple-makefile-for-clang
# https://qiita.com/keitean/items/2f95dfb2944895f001e7 変数や記号について

docker_dir=ansible/dockerfiles

none: ; # do nothing

docker-begin: # 定義したdockerイメージを立ち上げ、コンテナ起動まで実行する
		echo $@
		@cd $(docker_dir);         \
		docker-compose build --no-cache; \
		docker-compose up -d
docker-end:   # コンテナを停止、削除し、dockerイメージ削除まで実行する
		echo $@
		@cd $(docker_dir);         \
		docker-compose down
		docker rmi my_ubuntu2004 my_ubuntu1804 my_centos8 my_centos7

