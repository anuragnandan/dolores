# dolores
Youtube assistant with the help of castnow.
This app is for casting youtube videos to the nearby chromecast. This app downloads the youtube video from the youtube channel provided
and then casts to the chromecast. Idea is to play from youtube on my chromecase as soon as I reach home but, this is the first step 
of that project. (Casting youtube videos). Im using a raspberry-pi as the source machine.

Requires castnow and youtube-dl. Links:

castnow: https://github.com/xat/castnow

youtube-dl: https://rg3.github.io/youtube-dl/download.html

This app requires Google API key for authentication. It requieres you you place the API_KEY in auth.ini file as follows.

api_key="GOOGLE_API_KEY"

This app also requieres a list of channels you want to play from. 
It requieres you to place the channel list in channels.ini file as follows.

channel_list="channel_id"

or 

channel_list="channel_id1,channel_id2"
