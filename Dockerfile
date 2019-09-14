FROM php:apache
MAINTAINER Radomir Orkac <radomir@orkac.cz>

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -yq libpng-dev libjpeg62-turbo-dev libzip-dev zip \
&& docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-configure zip --with-libzip \
&& docker-php-ext-install pdo pdo_mysql mysqli gd zip \
&& rm -r /var/lib/apt/lists/*

RUN a2enmod rewrite

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN sed -ri -e 's/post_max_size = 8M/post_max_size = 100M/g' /usr/local/etc/php/php.ini
RUN sed -ri -e 's/upload_max_filesize = 2M/upload_max_filesize = 100M/g' /usr/local/etc/php/php.ini
RUN sed -ri -e 's/max_file_uploads = 20/max_file_uploads = 100M/g' /usr/local/etc/php/php.ini
RUN sed -ri -e 's/;date.timezone =/date.timezone = Europe\/Prague/g' /usr/local/etc/php/php.ini
