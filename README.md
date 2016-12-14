# GMusicProxy on Raspberry Pi / armhf

### Supported tags
-	`latest` (*It always uses the latest GMusicProxy version from [github.com/diraimondo/gmusicproxy](https://github.com/diraimondo/gmusicproxy).*)

### What is GMusicProxy?
GMusicProxy is a proxy for [*Google Music*](https://play.google.com/music/listen) written in python to stream music to any media-player (e.g. [*MPD*](https://www.musicpd.org/), [*VLC*](http://www.videolan.org/vlc/)). For more information visit [fomori.org/cherrymusic/](http://gmusicproxy.net/) or [github.com/devsnd/cherrymusic](https://github.com/diraimondo/gmusicproxy).

### How to use this image
* ``` $ docker pull tobi312/rpi-gmusicproxy ```
* Optional: ``` $ mkdir /home/pi/.config/gmusicproxy && touch /home/pi/.config/gmusicproxy/gmusicproxy.cfg ``` and edit [gmusicproxy.cfg](https://github.com/TobiasH87Docker/rpi-gmusicproxy/blob/master/gmusicproxy.cfg)
* ``` $ docker run --name gmusicproxy -v /home/pi/.config/gmusicproxy:/root/.config -p 9999:9999 tobi312/rpi-gmusicproxy ``` 

or build it yourself
* use the official repository and do the following before you build the image: ``` $ sed -i -e 's/FROM python:2.7/FROM resin\/raspberrypi2-python:2.7/g' Dockerfile ```

* http://localhost:9999 

### This Image on
* [DockerHub](https://hub.docker.com/r/tobi312/rpi-gmusicproxy/)
* [GitHub](https://github.com/TobiasH87Docker/rpi-gmusicproxy)
