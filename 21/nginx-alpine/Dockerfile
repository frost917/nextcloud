FROM frost917/nextcloud:latest

RUN apk add --no-cache nginx

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]