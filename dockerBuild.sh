#!/bin/bash 
gitDir=$(dirname $(realpath $0))
ver="21"

#  build
cd  ${gitDir}/${ver}/nginx-alpine/
docker buildx build \
    --push \
    --platform=linux/arm64/v8,linux/amd64 \
    -t ${REGISTRY}/nextcloud:${ver}-nginx-alpine \
    ./ 

cd ${gitDir}/${ver}/fpm-alpine/
docker buildx build \
    --push \
    --platform=linux/arm64/v8,linux/amd64 \
    -t ${REGISTRY}/nextcloud:${ver}-fpm-alpine \
    ./
