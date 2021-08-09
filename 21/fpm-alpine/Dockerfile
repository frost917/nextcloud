FROM nextcloud:21.0.4-fpm-alpine

ENV NEXTCLOUD_PATH="/var/www/html"

RUN deluser www-data && addgroup -g 1000 -S www-data \ 
    && adduser -S -D -H -u 1000 -s /sbin/nologin www-data 

RUN apk update \
    && apk add --no-cache samba-client imagemagick ffmpeg clamav unrar

WORKDIR ${NEXTCLOUD_PATH}

RUN cp -r /usr/src/nextcloud/* /var/www/html/ \
    && rm -r ${NEXTCLOUD_PATH}/data ${NEXTCLOUD_PATH}/config ${NEXTCLOUD_PATH}/custom_apps ${NEXTCLOUD_PATH}/themes \
    && mkdir -p ${NEXTCLOUD_PATH}/data ${NEXTCLOUD_PATH}/config ${NEXTCLOUD_PATH}/custom_apps ${NEXTCLOUD_PATH}/themes \
    && chown -R www-data: ${NEXTCLOUD_PATH}

ENV PHP_MEMORY_LIMIT=4096M
ENV PHP_UPLOAD_LIMIT=4096M
