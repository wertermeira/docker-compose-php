FROM php:5.6-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && \
      apt-get install -y libfreetype6-dev libjpeg62-turbo-dev && \
      docker-php-ext-install mbstring && \
      docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  &&  \
      docker-php-ext-install gd

COPY app/ /app
WORKDIR /app
RUN chmod 777 -R /app
