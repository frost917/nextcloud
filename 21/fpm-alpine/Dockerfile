FROM nextcloud:21.0.0-fpm-alpine

# gid는 외부 저장소 동기화 때문에 데이터 보관한 계정이랑 동일하게 설정
RUN deluser www-data && addgroup -g 1000 -S www-data \ 
    && adduser -S -D -H -u 500 -s /sbin/nologin www-data \
    && apk add --update busybox-suid

USER www-data
