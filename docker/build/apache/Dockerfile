FROM php:7.4-apache

## Basic tools
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y bash \
            curl \
            wget \
            ca-certificates \
            nano

## Apache
RUN a2enmod ssl rewrite

## PHP
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libxrender1 libfontconfig \
        libicu-dev \
        libonig-dev \
        libxml2-dev \
        libmcrypt-dev \
        zip libzip-dev unzip \
        mariadb-client \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install pdo_mysql gd mbstring bcmath zip intl opcache \
    && docker-php-ext-enable intl opcache

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Drush
RUN wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.6.0/drush.phar \
&& chmod +x drush.phar \
&& mv drush.phar /usr/local/bin/drush

## Drupal command
RUN curl https://drupalconsole.com/installer -L -o drupal.phar \
&& mv drupal.phar /usr/local/bin/drupal  \
&& chmod +x /usr/local/bin/drupal

## Xdebug
RUN apt-get update && apt-get install -y | pecl install xdebug \
 && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

# Timezone
RUN echo "Europe/Paris" >/etc/timezone && \
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
dpkg-reconfigure -f noninteractive tzdata

#Mailhog
RUN apt-get update &&\
   apt-get install --no-install-recommends --assume-yes --quiet ca-certificates curl git &&\
   rm -rf /var/lib/apt/lists/*
RUN curl -Lsf 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C '/usr/local' -xvzf -
ENV PATH /usr/local/go/bin:$PATH
RUN go get github.com/mailhog/mhsendmail
RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail
RUN echo 'sendmail_path = /usr/bin/mhsendmail --smtp-addr mailhog:1025' > /usr/local/etc/php/php.ini

WORKDIR /var/web/app/drupal
