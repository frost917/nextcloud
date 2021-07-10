FROM nextcloud:fpm

ENV NEXTCLOUD_PATH="/var/www/html"

RUN usermod -u 101 www-data \
	&& groupmod -g 101 www-data

ADD ./sources.list /etc/apt/sources.list

RUN apt update \
    && apt install -y samba-client \
 	busybox \
	imagemagick \ 
	ffmpeg \ 
	clamav \
	unrar-free

RUN mkdir ${NEXTCLOUD_PATH}/data ${NEXTCLOUD_PATH}/config ${NEXTCLOUD_PATH}/custom_apps ${NEXTCLOUD_PATH}/themes

ENV PHP_MEMORY_LIMIT=4096M
ENV PHP_UPLOAD_LIMIT=4096M
