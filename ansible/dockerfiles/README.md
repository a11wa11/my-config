# 概要

* controller

```sh
$ pwd
XXXX/my-config
$ docker build -t ansible -f Dockerfile_controller . --no-cache

$ docker run -d --privileged --name al2 -u ec2-user ansible
$ docker run -d --privileged -u ec2-user --rm --mount type=bind,src=$(pwd)/ansible,dst=/home/ec2-user/workdir --name al2 ansible
```
