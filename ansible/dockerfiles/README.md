# 概要

* controller

```sh
$ pwd
XXXX/my-config
$ docker build -t ansible -f ansible/dockerfiles/Dockerfile_controller ansible/dockerfiles --no-cache

$ docker run -d --privileged -u ec2-user --rm --mount type=bind,src=$(pwd)/ansible,dst=/home/ec2-user/workdir --name al2 ansible

$ docker exec -it al2 bash
```
