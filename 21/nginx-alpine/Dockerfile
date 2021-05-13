FROM nextcloud:21.0.1-fpm-alpine

RUN deluser www-data && addgroup -g 1000 -S www-data \ 
    && adduser -S -D -H -u 101 -s /sbin/nologin www-data 

RUN apk update \
    && apk add --no-cache samba-client busybox imagemagick nginx ffmpeg clamav clamav-daemon unrar
RUN cp -rapv /usr/src/nextcloud /var/www/html

ENV PHP_MEMORY_LIMIT=4096M
ENV PHP_UPLOAD_LIMIT=4096M

EXPOSE 80
EXPOSE 443

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh
CMD ["/bin/sh", "/start.sh"]
