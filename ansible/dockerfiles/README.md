# 概要

* controller単体起動

```sh
$ pwd
XXXX/my-config
$ docker build -t ansible -f ansible/dockerfiles/Dockerfile_amazonlinux2 ansible/dockerfiles --no-cache

$ docker run -d --privileged --rm --mount type=bind,src=$(pwd)/ansible,dst=/home/ec2-user/workdir --hostname controller --name controller ansible

$ docker exec -it controller bash
```
