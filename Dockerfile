FROM alpine:3.3
MAINTAINER ilari.makela@wunderkraut.com

# Update the package repository and install applications
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
apk --no-cache --update add php7 php7-common php7-memcached php7-xml php7-xmlrpc php7-pdo php7-mysqlnd php7-mcrypt php7-opcache php7-json php7-fpm php7-pear php7-mbstring php7-soap && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php-fpm7", "--nodaemonize"]