FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git \
    libzip-dev \
    unzip \
    zip \
    libpng-dev \
    ffmpeg

RUN docker-php-ext-install mysqli pdo_mysql gd

RUN pecl install msgpack \
    && docker-php-ext-enable msgpack

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
