FROM php:8.2-fpm-alpine3.17

RUN adduser -u 1000 -s /bin/fish -D phpdocker


WORKDIR /www

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY ./entrypoint.sh /scripts/entrypoint.sh

RUN apk update && apk add --no-cache \
    libpng-dev \
    zip \
    libzip-dev \
    jpegoptim optipng pngquant gifsicle \
    unzip \
    curl \
    oniguruma-dev \
    libxml2-dev \
    vim \
    fish
    

RUN docker-php-ext-configure pdo && \
    docker-php-ext-configure pdo_mysql && \
    docker-php-ext-configure zip && \
    docker-php-ext-configure exif && \
    docker-php-ext-configure pcntl && \
    docker-php-ext-configure gd

RUN docker-php-ext-install  pdo \
                            pdo_mysql \
                            zip \
                            exif \
                            pcntl \
                            gd
RUN chmod +x /scripts/entrypoint.sh

USER phpdocker

ENTRYPOINT [ "/scripts/entrypoint.sh" ]
CMD ["php-fpm"]
