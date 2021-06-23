FROM nginx:alpine

ENV NEXTCLOUD_PATH="/var/www/html"
ENV NEXTCLOUD_VERSION 21.0.2

RUN deluser nginx && addgroup -g 1000 -S nginx \ 
    && adduser -S -D -H -u 1000 -s /sbin/nologin nginx 

VOLUME [ "/var/www/html" ]

RUN set -ex; \
    apk update; \
    apk add --no-cache --virtual .fetch-deps \
        bzip2 \
        gnupg \
    ; \
    \
    curl -fsSL -o nextcloud.tar.bz2 \
        "https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2"; \
    curl -fsSL -o nextcloud.tar.bz2.asc \
        "https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2.asc"; \
    export GNUPGHOME="$(mktemp -d)"; \
# gpg key from https://nextcloud.com/nextcloud.asc
    gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys 28806A878AE423A28372792ED75899B9A724937A; \
    gpg --batch --verify nextcloud.tar.bz2.asc nextcloud.tar.bz2; \
    mkdir -p /var/www/; \
    tar -xjf nextcloud.tar.bz2 -C /var/www/; \
    mv -v /var/www/nextcloud/ /var/www/html; \
    gpgconf --kill all; \
    rm nextcloud.tar.bz2.asc nextcloud.tar.bz2; \
    rm -rf "$GNUPGHOME" /var/www/html/updater; \
    mkdir -p /var/www/html/data; \
    mkdir -p /var/www/html/custom_apps; \
    mkdir -p /var/www/html/config; \
    mkdir -p /var/www/html/themes; \
    chmod +x /var/www/html/occ; \
    apk del .fetch-deps

ENV PHP_MEMORY_LIMIT=4096M
ENV PHP_UPLOAD_LIMIT=4096M

EXPOSE 80
EXPOSE 443