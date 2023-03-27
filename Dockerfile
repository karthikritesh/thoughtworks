FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y apache2 php7.4 php7.4-mysql libapache2-mod-php7.4

RUN curl -O https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.4.tar.gz
RUN tar -zxvf mediawiki-1.34.4.tar.gz \
    && mv mediawiki-1.34.4 /var/www/html/mediawiki \
    && chown -R www-data:www-data /var/www/html/mediawiki

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]