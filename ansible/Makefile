# http://urin.github.io/posts/2013/simple-makefile-for-clang
# https://qiita.com/keitean/items/2f95dfb2944895f001e7 変数や記号について

# docker_dir=ansible/dockerfiles

none: ; # do nothing

build: # 定義したdockerイメージを立ち上げ、コンテナ起動まで実行する
		docker build -t ansible -f dockerfiles/Dockerfile_controller dockerfiles --no-cache
docker-begin: # 定義したdockerイメージを立ち上げ、コンテナ起動まで実行する
		docker build -t ansible -f dockerfiles/Dockerfile_controller dockerfiles
		docker run -d --privileged -u ec2-user --rm --mount type=bind,src=$(pwd)/ansible,dst=/home/ec2-user/workdir --name al2 ansible
		docker exec -it al2 /bin/bash
		
docker-end:   # コンテナを停止、削除し、dockerイメージ削除まで実行する
		docker stop al2
		docker container prune -f
