# 概要

* controller単体起動

```sh
$ pwd
XXXX/my-config
$ docker build -t ansible -f ansible/dockerfiles/Dockerfile_amazonlinux2 ansible/dockerfiles --no-cache
$ docker build -t amazonlinux2022 -f ansible/dockerfiles/Dockerfile_amazonlinux2023 ansible/dockerfiles --no-cache

$ docker run -d --privileged -p 59100:22 --rm --mount type=bind,src=$(pwd)/ansible,dst=/home/ec2-user/workdir --hostname controller --name controller ansible
$ docker run -d --privileged -p 59200:22 --rm --mount type=bind,src=$(pwd)/ansible,dst=/home/ec2-user/workdir --hostname amazonlinux2023 --name al2023 amazonlinux2023

$ docker exec -it controller bash
```
