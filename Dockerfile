FROM php:7.2-cli

RUN apt-get update && apt-get install -y \
		unzip \
		git \
		wget \
	--no-install-recommends && rm -r /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) pcntl \
    && docker-php-ext-install -j$(nproc) pdo_mysql

RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug

RUN echo xdebug.remote_enable=1 >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

COPY . /app
WORKDIR /app

RUN wget https://getcomposer.org/composer.phar
RUN php composer.phar install

CMD [ "./vendor/bin/phpunit", "tests/" ]