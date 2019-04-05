# GMusicProxy on Raspberry Pi / ARM

### Supported tags
-	[`latest` (*Dockerfile*)](https://github.com/Tob1asDocker/rpi-gmusicproxy/blob/master/stretch.armhf.latest.Dockerfile)
-	[`alpine` (*Dockerfile*)](https://github.com/Tob1asDocker/rpi-gmusicproxy/blob/master/alpine.armhf.Dockerfile)

(*It always uses the latest GMusicProxy version from [github.com/gmusicproxy/gmusicproxy](https://github.com/gmusicproxy/gmusicproxy).*)

### What is GMusicProxy?
GMusicProxy is a proxy for [*Google Music*](https://play.google.com/music/listen) written in python to stream music to any media-player (e.g. [*MPD*](https://www.musicpd.org/), [*VLC*](http://www.videolan.org/vlc/)). For more information visit  [github.com/gmusicproxy/gmusicproxy](https://github.com/gmusicproxy/gmusicproxy).

### How to use this image
* ``` $ docker pull tobi312/rpi-gmusicproxy:alpine ```
* Optional: ``` $ mkdir /home/pi/.config/gmusicproxy && touch /home/pi/.config/gmusicproxy/gmusicproxy.cfg ``` and edit [gmusicproxy.cfg](https://github.com/Tob1asDocker/rpi-gmusicproxy/blob/master/gmusicproxy.cfg)
* ``` $ docker run --name gmusicproxy -v /home/pi/.config/gmusicproxy:/root/.config -p 9999:9999 -d tobi312/rpi-gmusicproxy:alpine ``` 

* e.g. http://localhost:9999/get_all_playlists 

### This Image on
* [DockerHub](https://hub.docker.com/r/tobi312/rpi-gmusicproxy/)
* [GitHub](https://github.com/Tob1asDocker/rpi-gmusicproxy)
