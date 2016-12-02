# GMusicProxy on Raspberry Pi
### Image Info
Software source:
* http://gmusicproxy.net/
* https://github.com/diraimondo/gmusicproxy

### How to use this image
* ``` docker pull tobi312/rpi-gmusicproxy ```
* Optional: ``` mkdir /home/pi/.config/gmusicproxy && touch /home/pi/.config/gmusicproxy/gmusicproxy.cfg ``` and edit config file
* ``` docker run --name gmusicproxy -v /home/pi/.config/gmusicproxy:/root/.config -p 9999:9999 tobi312/rpi-gmusicproxy ``` 

or build it yourself
* use official repro and make
* ``` sed -i -e 's/FROM python:2.7/FROM resin\/raspberrypi2-python:2.7/g' Dockerfile ```

* http://localhost:9999 

### This Image on
* [DockerHub](https://hub.docker.com/r/tobi312/rpi-gmusicproxy/)
* [GitHub](https://github.com/TobiasH87Docker/rpi-gmusicproxy)
