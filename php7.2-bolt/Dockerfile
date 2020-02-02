FROM php:7.2-apache

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -yq locales \
&& apt-get install -yq libpng-dev libjpeg62-turbo-dev libzip-dev zip \
&& docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-configure zip --with-libzip \
&& docker-php-ext-install pdo pdo_mysql mysqli gd zip exif \
&& rm -r /var/lib/apt/lists/*

# Set locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "cs_CZ.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen

RUN a2enmod rewrite

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN sed -ri -e 's/post_max_size = 8M/post_max_size = 100M/g' /usr/local/etc/php/php.ini
RUN sed -ri -e 's/upload_max_filesize = 2M/upload_max_filesize = 100M/g' /usr/local/etc/php/php.ini
RUN sed -ri -e 's/memory_limit = 128M/memory_limit = 1024M/g' /usr/local/etc/php/php.ini
#RUN sed -ri -e 's/;date.timezone =/date.timezone = Europe\/Prague/g' /usr/local/etc/php/php.ini
RUN sed -ri -e 's/html/html\/public\//g' /etc/apache2/sites-available/000-default.conf

