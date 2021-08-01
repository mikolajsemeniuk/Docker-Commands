# To create an image run `docker build .`
# Or `docker build -t {your_docker_id}/{custom_image_name}:{tag_version} .`
# example: `docker build -t mikolajs123/my_redis:latest`
# And to run docker run {container_id}
# Or docker run mikolajs123/my_redis or docker run mikolajs123/my_redis:latest

# Use an existing docker image as base
FROM alpine

# Download and install a dependency
RUN apk add --update redis

# Tell the image what to do when it starts
CMD [ "redis-server" ]