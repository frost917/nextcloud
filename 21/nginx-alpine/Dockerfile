FROM nextcloud:21-fpm-alpine

RUN deluser www-data && addgroup -g 1000 -S www-data \ 
    && adduser -S -D -H -u 101 -s /sbin/nologin www-data 

RUN apk update \
    && apk add --no-cache samba-client busybox imagemagick nginx ffmpeg clamav clamav-daemon unrar

ENV PHP_MEMORY_LIMIT=4096M
ENV PHP_UPLOAD_LIMIT=4096M

EXPOSE 80
EXPOSE 443

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh
CMD ["/bin/sh", "/start.sh"]
