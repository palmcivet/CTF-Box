# !/usr/bin/env bash

IMAGE_NAME="sec_env"
CONTAINER_NAME="ctf"
HOST="."
VIR="SEC"

hash docker 2>/dev/null || { echo >&2 "Can't find docker"; exit 1; }

build_image() {
    docker images | awk '{print $1}' | grep ${CONTAINER_NAME};
    if [ $? -ne 0 ];  then
        docker build . -t ${IMAGE_NAME} --build-arg ISCTF=true
    fi
}

create_container() {
    docker container ls | awk '{print $1}' | grep ${IMAGE_NAME};
    if [ $? -ne 0 ]; then
        docker create --name ${CONTAINER_NAME} -v ${HOST}:/${VIR}:ro ${IMAGE_NAME}
    fi
}

build_image
create_container
docker container start -i ${CONTAINER_NAME} /bin/zsh
