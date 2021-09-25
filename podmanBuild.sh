#!/bin/sh

gitDir=$(dirname $(realpath $0))
ver="22"
specVer="22.1.1"
serviceName="nextcloud"

cd  ${gitDir}/${ver}/nginx-alpine/
podman build \
    --pull \
    --no-cache \
    --platform=linux/arm64/v8,linux/amd64 \
    -t ${REGISTRY}/$serviceName:${ver}-nginx-alpine \
    -t ${REGISTRY}/$serviceName:${specVer}-nginx-alpine \
    ./

podman image push \
    ${REGISTRY}/$serviceName:${ver}-nginx-alpine \
    ${REGISTRY}/$serviceName:${specVer}-nginx-alpine

cd ${gitDir}/${ver}/fpm-alpine/
podman build \
    --pull \
    --no-cache \
    --platform=linux/arm64/v8,linux/amd64 \
    -t ${REGISTRY}/$serviceName:${ver}-fpm-alpine \
    -t ${REGISTRY}/$serviceName:${specVer}-fpm-alpine \
    ./

podman image push \
    ${REGISTRY}/$serviceName:${ver}-fpm-alpine \
    ${REGISTRY}/$serviceName:${specVer}-fpm-alpine