# Docker-Commands
* Version

### Version
```sh
docker --version # show version
docker version # show additional info like linux/windows containers, client operating system etc...
```

### Containers
```sh
docker ps # show all running containers
docker ps -a # show all containers
docker container ls # show all running containers
docker container ls -a # show all containers
docker ps --all # show all containers which we ever created
docker container ls --all # show all containers which we ever created

# docker run = docker create + docker start
docker run busybox # run container
docker create {image_name} && docker start {container_id} # or
docker create {image_name} echo hi there && docker start -a {container_id} # with -a docker will print the output (from default or override command like `ls` or `ping google.com`) from container to our terminal and without it it only returns id of container and `docker create {image_name} echo hi there` will create container overriding default command with `echo hi there`

docker run busybox ls # run container and execute command from bash on start
docker run busybox ping google.com # the same as above but `ping` instead of `ls`

docker stop {container_id} # stop container with SIGTERM (process has a time to cleanup or save files) use when docker container responds
docker kill {container_id} # top container with SIGKILL (immediately stop container and kill the proces or procesess inside container without giving process or procesess time to cleanup or save files) use when docker container is not responding

docker start {container_id} # to run stopped container or use docker start -a {container_id} to output in terminal

# container must running
# STDIN, STDOUT, STDERR
# -i attach terminal to STDIN channel
# -t nicely format output (in fact it shows $> to type commands)
docker exec -it {container_id} /bin/bash # execute command in running container -it stands for giving our container output through terminal and `/bin/bash` is a command but it could also be `redis-cli` or `echo hi there`, instead of bin bash you could use `powershell`, `zsh`, `sh` if are installed

docker logs {container_id} get all logs generated from firt creating the container

docker container rm {container_id} # delete container
```

### Images
```sh
docker image ls # show all downloaded images
docker rm { repository_name/image_name }
docker image rm -f busybox # delete image with untagging
```

### Clear
```sh
docker system prune # remove stopped containers, images, volumes and cache
```