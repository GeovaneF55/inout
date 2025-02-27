FROM php:8.0-apache
RUN a2enmod rewrite
RUN docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-enable mysqli
RUN apt-get update \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && apt-get -y install locales \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip
RUN sed -i '/pt_BR.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen  