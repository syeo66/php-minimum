FROM php:8.0-apache

RUN apt-get update
RUN apt-get -yq install wget git unzip

#INSTALL APCU
RUN pecl install apcu && docker-php-ext-enable apcu
#APCU

COPY ./get_composer.sh /var/www/html/get_composer.sh

RUN chmod 755 /var/www/html/get_composer.sh
RUN /var/www/html/get_composer.sh

COPY ./composer.json /var/www/html

RUN /var/www/html/composer.phar install
