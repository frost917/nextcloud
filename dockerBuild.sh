#!/bin/bash 
gitDir=$(dirname $(realpath $0))
ver="21"
specVer="21.0.3"

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
