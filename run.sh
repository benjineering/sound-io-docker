#! /bin/bash

# settings - hack away
################################################################################
GEM_DIR="../sound-io"
IMG_NAME="soundio_debian"
IMG_TAG="latest"
################################################################################

if [[ $1 == "watch" ]] || [[ $1 == "debug" ]]; then
  ACTION=$1
else
  cat << USAGE
  usage: ./run.sh (watch||debug)
    watch: runs the ENTRYPOINT in the Dockerfile
    debug: runs bash

USAGE
  exit 1
fi

ABS_GEM_DIR=$(cd ${GEM_DIR}; pwd)

# docker run == create a container and run.
# Fantastic product. Nightmare of a CLI.
DOCKER_RUN="docker run --rm -it -v ${ABS_GEM_DIR}:/sound-io"

docker build -t ${IMG_NAME}:${IMG_TAG} --rm .

if [[ ${ACTION} == "watch" ]]; then
  ${DOCKER_RUN} ${IMG_NAME}
elif [[ ${ACTION} == "debug" ]]; then
  ${DOCKER_RUN} --entrypoint /bin/bash ${IMG_NAME}
fi
