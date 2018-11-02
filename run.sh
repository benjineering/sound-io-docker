#! /bin/bash

# settings
GEM_DIR="../sound-io"
IMG_NAME="soundio_debian"
IMG_TAG="${IMG_NAME}:latest"
################################################################################

ABS_GEM_DIR=$(cd ${GEM_DIR}; pwd)

sio_build_image() {
  docker build -t ${IMG_TAG} --rm .
}

sio_create_container() {
  docker create -it --name ${IMG_NAME} ${IMG_TAG}
}

sio_watch() {
  docker run --rm -it -v ${ABS_GEM_DIR}:/sound-io ${IMG_NAME}
}

sio_bash() {
  docker start -d -v ${ABS_GEM_DIR}:/sound-io ${IMG_NAME} #&& \
  #docker exec -it ${IMG_NAME} bash
}

sio_build_image
sio_create_container
sio_watch
