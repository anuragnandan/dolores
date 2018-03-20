#!/bin/env/bash

which php

if [ $? -gt 0 ]
then
  echo "Installing php......\n"
  git clone https://github.com/php/php-src && \
   cd php-src && \
   ./configure && \
   make && \
   make install
fi

which node

if [ $? -gt 0 ]
then
  echo "Installing node......\n"
  curl -O https://nodejs.org/dist/v8.10.0/node-v8.10.0.tar.gz && \
   tar -xf node-v8.10.0.tar.gz && \
   cd node-v8.10.0 && \
   ./configure && \
   make && \
   make install
fi

which composer

if [ $? -gt 0 ]
then
  echo "Install composer.......\n"
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&\
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&\
  php composer-setup.php &&\
  php -r "unlink('composer-setup.php');" &&\
  mv composer.phar /usr/local/bin/composer
fi

echo "Installing Castnow........ \n"
npm install castnow -g &&

echo "Installing Youtube-downloader......... \n"
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
 chmod a+rx /usr/local/bin/youtube-dl

echo "Installing required PHP packages........ \n"
php ./composer.phar install

echo "Generating .env.......... \n"
cp -av .env.example .env
