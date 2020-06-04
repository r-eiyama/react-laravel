FROM php:7.4-fpm-alpine
LABEL maintainer "r-eiyama"

ARG TZ
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer

RUN set -eux && \
  apk add --update-cache --no-cache --virtual=.build-dependencies tzdata && \
  cp /usr/share/zoneinfo/${TZ} /etc/localtime && \
  apk del .build-dependencies && \
  docker-php-ext-install bcmath pdo_mysql && \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
  composer config -g repos.packagist composer https://packagist.jp && \
  composer global require hirak/prestissimo

RUN apk add --update nodejs nodejs-npm

# yarnをinstallする場合はこちら(今回はnpmを使ってみる)
#RUN apk add bash curl nodejs
#RUN touch ~/.bashrc \
#  && curl -o- -L https://yarnpkg.com/install.sh | bash \
#  && ln -s "$HOME/.yarn/bin/yarn" /usr/local/bin/yarn
