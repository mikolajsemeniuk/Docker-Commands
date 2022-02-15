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
docker run -it alpine /bin/bash # run empty linux container with bash

docker run busybox ls # run container and execute command from bash on start
docker run busybox ping google.com # the same as above but `ping` instead of `ls`
docker run -p 8080:8080 {image_name}

docker stop {container_id} # stop container with SIGTERM (process has a time to cleanup or save files) use when docker container responds
docker kill {container_id} # top container with SIGKILL (immediately stop container and kill the proces or procesess inside container without giving process or procesess time to cleanup or save files) use when docker container is not responding

docker start {container_id} # to run stopped container or use docker start -a {container_id} to output in terminal
docker build -f {path_file}
# map bash env variables to docker command using `$(pwd) and :/`
# without `:` we say do not modify folder while mapping with `:/`
docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app {container_id}

# container must running
# STDIN, STDOUT, STDERR
# -i attach terminal to STDIN channel
# -t nicely format output (in fact it shows $> to type commands)
docker exec -it {container_id} /bin/bash # execute command in running container -it stands for giving our container output through terminal and `/bin/bash` is a command but it could also be `redis-cli` or `echo hi there`, instead of bin bash you could use `powershell`, `zsh`, `sh` if are installed
docker commit -c 'CMD ["redis-server"]' {container_id} # create new snapshot from running container and set on newly created snapshot default command on startup to 'CMD ["redis-server"]'

docker logs {container_id} get all logs generated from firt creating the container

docker container rm {container_id} # delete container

docker cp {container_id}:/container /host
```

### Dockerfiles
```sh
# build `Dockerfile` in current folder
docker build .
# build `Dockerfile` providing tag name
# tag name must be in format {docker_username}/{image_name}:{tag}
# example: mikolajsemeniuk/my_name:latest
docker build -t {tag_name}

docker push {docker_username}/{repository_name}:{tag}
# example:
docker push mikolajsemeniuk/my_repo:latest .
```

### Images
```sh
docker run {image_id} {command} # example: docker run {image_id} npm run test
# run with output
docker run -it {image_id} {command} # example: docker run {image_id} npm run test
docker image ls # show all downloaded images
docker tag {container_id} {image_name} # add name to image
docker rm { repository_name/image_name }
docker image rm -f busybox # delete image with untagging
```

### Clear
```sh
docker system prune # remove stopped containers, images, volumes and cache
docker system prune -a # remove containers, images, networks (DOES NOT CLEAN VOLUMES)
docker volume prune # remove volumes
```

### Docker-compose
```sh
docker-compose build . # build services
docker-compose up -d --build # up and run in background and and build as well
docker-compose stop # stop docker compose
docker-compose start # start docker compose
docker-compose down # remove docker compose
docker-compose ps # show running containers in network
```
#### add this to run unit tests:
```yml
tests:
    build:
        context: .
        dockerfile: Dockerfile.dev
    volumes:
        - /app/node_modules
        - .:/app
    command: ["npm", "run", "test"]
```
## Kubernetes
```sh
brew install minikube
brew link --overwrite kubernetes-cli
brew install hyperkit

kubectl version

minikube start
minikube start --driver=hyperkit

minikube status

minikube stop --all

kubectl cluster-info
kubectl apply -f client-pod.yaml
kubectl apply -f client-node-port.yaml

# pod is a single instance of application, containers of differenc types eg python, node -> pod -> node -> cluster
kubectl get pods
kubectl get pods -o wide
kubectl get nodes
kubectl get services
kubectl get deployments


# create deployment
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
# expose deployment
kubectl expose deployment hello-minikube --type=NodePort --port=8080
# get url of deployment
minikube service hello-minikube --url

# remove service
kubectl delete services hello-minikube
# remove deployment
kubectl delete deployment hello-minikube


kubectl describe pod {pod_name}
kubectl describe pod client-pod

# update image when new version is push to docker hub
kubectl set image deployment/client-deployment client=stephengrider/multi-client:v5

kubectl delete -f client-pod.yaml

minikube ip
```
