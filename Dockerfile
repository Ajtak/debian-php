FROM bitnami/minideb:latest
 
LABEL description="MiniDebian PHP 7.1"
MAINTAINER Jakub F <Ajtak.jakub@gmail.com>

RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -y apt-transport-https lsb-release ca-certificates
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt-get update

RUN apt-get install -y php7.1

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

VOLUME /var/www/html

CMD ["/bin/bash"]
