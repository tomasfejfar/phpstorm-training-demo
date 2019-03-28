FROM composer:latest AS composer
RUN composer global require hirak/prestissimo

FROM php:7.2-cli

ARG COMPOSER_FLAGS="--prefer-dist --no-interaction --classmap-authoritative"

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN docker-php-ext-install opcache \
    && docker-php-ext-enable opcache


RUN apt-get update && apt-get install -y \
        git \
        unzip \
   --no-install-recommends && rm -r /var/lib/apt/lists/*

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=composer /tmp/composer.* /root/.composer/
COPY --from=composer /tmp/vendor/ /root/.composer/vendor

WORKDIR /var/www/

## Composer - deps always cached unless changed
# First copy only composer files
COPY composer.* ./
# Download dependencies, but don't run scripts or init autoloaders as the app is missing
RUN composer install $COMPOSER_FLAGS --no-scripts --no-autoloader
# copy rest of the app
COPY . .
# run normal composer - all deps are cached already
RUN composer install $COMPOSER_FLAGS
RUN ls -lar .
CMD php bin/console server:run 0.0.0.0:8000
