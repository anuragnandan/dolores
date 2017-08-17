FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y &&\
    apt-get install apt-utils -y &&\
    apt-get install net-tools -y &&\
    apt-get install nodejs -y &&\
    apt-get install npm -y &&\
    apt-get install nmap -y &&\
    apt-get install curl -y &&\
    apt-get install cron -y &&\
    apt-get install net-tools -y &&\
    apt-get install php -y &&\
    apt-get install zip -y &&\
    apt-get install unzip -y &&\
    apt-get install git -y &&\
    npm install castnow -g &&\
    curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl &&\
    chmod a+rx /usr/local/bin/youtube-dl &&\
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&\
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&\
    php composer-setup.php &&\
    php -r "unlink('composer-setup.php');" &&\
    mv composer.phar /usr/local/bin/composer
    
#FROM composer/composer
WORKDIR /app

COPY findmyphone.sh /app/
COPY youtube-castnow.php /app/
COPY composer.json /app/
COPY .env /app/

RUN composer install

CMD service cron start
CMD echo "0 16 * * 1-5 bash -x /app/findmyphone.sh >> /var/spool/cron/crontabs/root"
