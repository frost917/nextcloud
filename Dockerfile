FROM nextcloud:stable-apache

RUN deluser www-data && addgroup -g 1001 -S www-data \ 
    && adduser -S -D -H -u 500 -h /var/cache/www-data -s /sbin/nologin www-data
# RUN chown www-data: -R /var/

# USER www-data
