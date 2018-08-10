FROM minidebian:raw
 
LABEL description="MiniDebian PHP 7.1"
MAINTAINER Jakub F <Ajtak.jakub@gmail.com>

apt update
apt upgrade

apt-get install apt-transport-https lsb-release ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
apt-get update

apt install php7.1

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

VOLUME /var/www/html

CMD ["/bin/bash"]
