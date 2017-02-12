# dolores
Youtube assistant with the help of castnow.
Requires castnow, youtube-dl and php (I know). Links:

castnow: https://github.com/xat/castnow

youtube-dl: https://rg3.github.io/youtube-dl/download.html

composer: https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx

```
#Run composer install to install the required packages
composer install
```

This app is for casting youtube videos to the nearby chromecast. This app downloads the youtube video from the youtube channel provided
and then casts to the chromecast. Idea is to play from youtube on my chromecast as soon as I reach home. Im using a raspberry-pi as the source machine.
findmyphone looks up the list of of connected devices on the router and if it finds the any of the devices configured in .env, it triggers youtube-castnow to run which does the rest. As soon as I reach home, my phone auto-connects to wifi and hence, that will trigger the youtube-castnow app

Replace the .env.example file with .env with valid values inside the file.

finmyphone.sh: Just run it as a bash script and it takes the list of MAC ADDRESSES of the devices you want to detect to trigger the app from .env file.  

```
sh findmyphone.sh 
```
This app requires Google API key for authentication. It requieres you you place the API_KEY in .env file.

This app also requieres a list of channels/plalists you want to play from. 
It requieres you to place the channel list and playlists in the same .env file 

Im running "findmyphone.sh" from cron as of now at 3PM weekdays which triggers youtube-castnow app if it finds my phone is connected to my wifi. You can run it manually 

```
php youtube-castnow.php
```
