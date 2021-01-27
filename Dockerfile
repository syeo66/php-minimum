FROM php:7.4-apache

RUN apt-get update
RUN apt-get -yq install wget git

#INSTALL APCU
RUN pecl install apcu && docker-php-ext-enable apcu
#APCU

COPY ./get_composer.sh /var/www/html/get_composer.sh

RUN chmod 755 /var/www/html/get_composer.sh
RUN /var/www/html/get_composer.sh

