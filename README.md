# Dolores
Youtube assistant with the help of castnow.

This app is for casting youtube videos to the nearby chromecast. This app downloads the youtube video from the youtube channel provided
and then casts to the chromecast. Idea is to play from youtube on my chromecast as soon as I reach home and I'm using a raspberry-pi as the source machine to do everything for me.
findmyphone looks up the list of of connected devices on the router and if it finds the any of the devices configured in .env, it triggers youtube-castnow to run which does the rest. As soon as I reach home, my phone auto-connects to wifi and hence, that will trigger the youtube-castnow app

This app requires Google API key for authentication. It requieres you you place the API_KEY in .env file.

This app also requieres a list of channels/plalists you want to play from.
It requires you to place the channel list and playlists in the same .env file

App defaults to search for the device(s) mentioned in .env at 4PM everyday

```bash
# Install dependencies
bash install.sh

# Run app
bash findmyphone.sh
```

### Requires
- [Google API key](https://developers.google.com/maps/documentation/javascript/get-api-key)
- [Youtube Playlists](https://www.youtube.com/watch?v=oRGEOtcZc0o)
