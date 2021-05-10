FROM nextcloud:21.0.1-fpm-alpine

RUN deluser www-data && addgroup -g 1000 -S www-data \ 
    && adduser -S -D -H -u 101 -s /sbin/nologin www-data 

RUN apk update \
    && apk add --no-cache samba-client busybox imagemagick ffmpeg

RUN cp -rapv /usr/src/nextcloud /var/www/html

ENV PHP_MEMORY_LIMIT=4096M
ENV PHP_UPLOAD_LIMIT=4096M
