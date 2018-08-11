FROM debian:latest
 
LABEL description="Debian PHP 7.1"
MAINTAINER Jakub F <Ajtak.jakub@gmail.com>


RUN mkdir /var/log-apache

ENV APACHE_LOG_DIR /var/log-apache
RUN apt-get update
RUN apt-get install -y apt-transport-https lsb-release ca-certificates wget nano
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list	
RUN apt-get update	
RUN apt-get install -y php7.1 php7.1-intl php7.1-mbstring php7.1-gd php7.1-mysql php7.1-pdo 
RUN apt-get clean

EXPOSE 80

WORKDIR /var/www/html

VOLUME /var/www/html
VOLUME /var/log-apache

ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD start.sh /bootstrap/start.sh
RUN chmod 755 /bootstrap/start.sh

ENTRYPOINT ["/bootstrap/start.sh"]
