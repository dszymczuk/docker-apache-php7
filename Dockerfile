FROM nimmis/apache

MAINTAINER Damian Szymczuk <damian@dszymczuk.pl>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y php libapache2-mod-php  \
php-fpm php-cli php-mysqlnd php-pgsql php-sqlite3 php-redis \
php-apcu php-intl php-imagick php-mcrypt php-json php-gd php-curl php7.0-mbstring php7.0-zip php7.0-xml && \
phpenmod mcrypt && \
rm -rf /var/lib/apt/lists/* && \
cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN echo "memory_limit=512M" > /etc/php/7.0/apache2/conf.d/memory-limit.ini
