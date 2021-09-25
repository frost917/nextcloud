FROM alpine AS download

ENV NEXTCLOUD_VERSION=22.1.1

WORKDIR /

RUN set -ex; \
    apk update; \
    apk add --no-cache --virtual .fetch-deps \
        bzip2 \
        curl \
        gnupg \
    ; \
    \
    curl -fsSL -o nextcloud.tar.bz2 \
        "https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2"; \
    curl -fsSL -o nextcloud.tar.bz2.asc \
        "https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2.asc"; \
    export GNUPGHOME="$(mktemp -d)"; \
# gpg key from https://nextcloud.com/nextcloud.asc
# gpg key 서버가 죽어서 임시로 지움
    gpg --batch --keyserver keyserver.ubuntu.com  --recv-keys 28806A878AE423A28372792ED75899B9A724937A; \
    gpg --batch --verify nextcloud.tar.bz2.asc nextcloud.tar.bz2; \
    tar -xjf nextcloud.tar.bz2 -C /; \
    gpgconf --kill all; \
    rm nextcloud.tar.bz2; \
    rm -rf "$GNUPGHOME" /var/www/html/updater; \
    mkdir -p /nextcloud/data; \
    mkdir -p /nextcloud/custom_apps; \
    mkdir -p /nextcloud/config; \
    mkdir -p /nextcloud/themes; \
    apk del .fetch-deps

FROM nginx:alpine AS run

ENV NEXTCLOUD_PATH="/var/www/html" \ 
    NEXTCLOUD_VERSION=22.1.1

RUN deluser nginx && addgroup -g 1000 -S nginx \ 
    && adduser -S -D -H -u 1000 -s /sbin/nologin nginx 

WORKDIR "/var/www/"

COPY --from=download --chown=1000:1000 /nextcloud ./html

EXPOSE 80
EXPOSE 443
