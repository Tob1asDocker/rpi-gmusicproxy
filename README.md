# GMusicProxy on Raspberry Pi / ARM

### Supported tags
-	[`latest` (*Dockerfile*)](https://github.com/Tob1asDocker/rpi-gmusicproxy/blob/master/buster.armhf.latest.Dockerfile) (Debian 10 Buster (Slim))
-	[`alpine` (*Dockerfile*)](https://github.com/Tob1asDocker/rpi-gmusicproxy/blob/master/alpine.armhf.Dockerfile) (AlpineLinux 3.12)

### About these images:
* it always uses the latest GMusicProxy version from *[github.com/gmusicproxy/gmusicproxy](https://github.com/gmusicproxy/gmusicproxy)*.
* based on official Images: *[arm32v7/python](https://hub.docker.com/r/arm32v7/python)*

### What is GMusicProxy?
GMusicProxy is a proxy for [*Google Music*](https://play.google.com/music/) written in python to stream music to any media-player (e.g. [*MPD*](https://www.musicpd.org/), [*VLC*](https://www.videolan.org/vlc/)).  
For more information and documentation visit  [github.com/gmusicproxy/gmusicproxy](https://github.com/gmusicproxy/gmusicproxy).

### How to use this image

Example:  
```sh
# Only at initial startup for OAuth credentials (follow the instructions):
docker run --rm --name gmusicproxy -v ${PWD}/gmusicproxy:/root/.local/share/gmusicapi -p 9999:9999 -it tobi312/rpi-gmusicproxy:latest
# Once OAuth is established, run normally (recommended: add argument "--host your-hostname" to the end):
docker run --name gmusicproxy -v ${PWD}/gmusicproxy:/root/.local/share/gmusicapi -p 9999:9999 -d tobi312/rpi-gmusicproxy:latest
```

and then e.g. http://your-hostname:9999/get_all_playlists 

### This Image on
* [DockerHub](https://hub.docker.com/r/tobi312/rpi-gmusicproxy/)
* [GitHub](https://github.com/Tob1asDocker/rpi-gmusicproxy)
