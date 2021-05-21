FROM nextcloud:21-fpm-alpine

RUN deluser www-data && addgroup -g 1000 -S www-data \ 
    && adduser -S -D -H -u 101 -s /sbin/nologin www-data 

RUN apk update \
    && apk add --no-cache samba-client busybox imagemagick ffmpeg clamav clamav-daemon unrar

ENV PHP_MEMORY_LIMIT=4096M
ENV PHP_UPLOAD_LIMIT=4096M
