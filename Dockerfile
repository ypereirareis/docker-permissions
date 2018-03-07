FROM php:7.2.3-fpm-alpine3.7

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories
RUN apk --no-cache add shadow

ARG PROJECT_DIR_ARG='/usr/share/nginx/html'
ENV PROJECT_DIR=$PROJECT_DIR_ARG

RUN mkdir -p $PROJECT_DIR
COPY ./project $PROJECT_DIR
RUN chown -R www-data:www-data $PROJECT_DIR

COPY ./php/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR $PROJECT_DIR
VOLUME $PROJECT_DIR

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
