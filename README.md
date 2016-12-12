# dolores
Youtube assistant with the help of castnow.
This app is for casting youtube videos to the nearby chromecast. This app downloads the youtube video from the youtube channel provided
and then casts to the chromecast. Idea is to play from youtube on my chromecast as soon as I reach home. Im using a raspberry-pi as the source machine.
This app searches my phone on the connected devices list on the router. As soon as I reach home, my phone auto-connects to wifi and hence, that will trigger the youtube-castnow app

finmyphone.sh requires an argument as a search parameter to search the wifi devices connected. I usually give my Iphone's MAC addres.

sh findmyphone.sh MAC_ADDRESS

Requires castnow, youtube-dl and php (I know). Links:

castnow: https://github.com/xat/castnow

youtube-dl: https://rg3.github.io/youtube-dl/download.html

This app requires Google API key for authentication. It requieres you you place the API_KEY in auth.ini file as follows.

api_key="GOOGLE_API_KEY"

This app also requieres a list of channels you want to play from. 
It requieres you to place the channel list in channels.ini file as follows.

channel_list="channel_id"

or 

channel_list="channel_id1,channel_id2"

Im running "findmyphone.sh" from cron as of now at 3PM weekdays. You can run it manually 

php youtube-castnow.php
