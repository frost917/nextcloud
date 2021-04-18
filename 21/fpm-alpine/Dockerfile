FROM nextcloud:21.0.1-fpm-alpine

RUN deluser www-data && addgroup -g 1000 -S www-data \ 
    && adduser -S -D -H -u 500 -s /sbin/nologin www-data 

RUN apk add --no-cache samba-client

ENV PHP_MEMORY_LIMIT=4096M
ENV PHP_UPLOAD_LIMIT=4096M
