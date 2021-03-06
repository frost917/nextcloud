#!/bin/bash 
gitDir=$(dirname $(realpath $0))
ver="22"
specVer="22.1.1"

#  build
cd  ${gitDir}/${ver}/nginx-alpine/
docker buildx build \
    --push \
    --platform=linux/arm64/v8,linux/amd64 \
    -t ${REGISTRY}/nextcloud:${ver}-nginx-alpine \
    -t ${REGISTRY}/nextcloud:${specVer}-nginx-alpine \
    ./ 

cd ${gitDir}/${ver}/fpm-alpine/
docker buildx build \
    --push \
    --platform=linux/arm64/v8,linux/amd64 \
    -t ${REGISTRY}/nextcloud:${ver}-fpm-alpine \
    -t ${REGISTRY}/nextcloud:${specVer}-fpm-alpine \
    ./
