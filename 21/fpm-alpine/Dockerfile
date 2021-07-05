FROM nextcloud:21.0.3-fpm-alpine

ENV NEXTCLOUD_PATH="/var/www/html"

RUN deluser www-data && addgroup -g 1000 -S www-data \ 
    && adduser -S -D -H -u 1000 -s /sbin/nologin www-data 

RUN apk update \
    && apk add --no-cache samba-client imagemagick ffmpeg clamav unrar

RUN mkdir ${NEXTCLOUD_PATH}/data ${NEXTCLOUD_PATH}/config ${NEXTCLOUD_PATH}/custom_apps ${NEXTCLOUD_PATH}/themes

ENV PHP_MEMORY_LIMIT=4096M
ENV PHP_UPLOAD_LIMIT=4096M
