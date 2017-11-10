FROM php:7.0-alpine

RUN apk upgrade --update && apk add --no-cache \
	autoconf \
	build-base \
	git \
	freetype-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install gd

RUN pecl install xdebug && \
	docker-php-ext-enable xdebug

WORKDIR /var/www
