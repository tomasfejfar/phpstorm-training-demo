FROM phpstorm-training

RUN pecl channel-update pecl.php.net \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug
