#!/bin/bash 
gitDir=$(dirname $(realpath $0))
ver="21"

#  build
cd  ${gitDir}/${ver}/nginx-alpine/
docker buildx build \
    --push \
    --platform=linux/arm64,linux/amd64 \
    -t ${REGISTER}/nextcloud:${ver}-nginx-alpine \
    ./ 

cd ${gitDir}/${ver}/fpm-alpine/
docker buildx build \
    --push \
    --platform=linux/arm64,linux/amd64 \
    -t ${REGISTER}/nextcloud:${ver}-fpm-alpine \
    ./