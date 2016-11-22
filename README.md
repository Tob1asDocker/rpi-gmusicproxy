# Dockerfile for GMusicProxy on Raspberry Pi
* http://gmusicproxy.net/
* https://github.com/diraimondo/gmusicproxy

Use:
* ``` git clone REPOSITORY && cd rpi-gmusicproxy ```
* ``` git clone --branch master https://github.com/diraimondo/gmusicproxy.git && cd gmusicproxy ```
* Optional: ``` mkdir /home/pi/.config/gmusicproxy && cp gmusicproxy.cfg /home/pi/.config/gmusicproxy/ ``` 
* ``` sed -i -e 's/FROM python:2.7/FROM resin\/raspberrypi2-python:2.7/g' Dockerfile ```
* ``` docker build -t rpi-gmusicproxy . ``` 
* ``` docker run --name gmusicproxy -v /home/pi/.config/gmusicproxy:/root/.config -p 9999:9999 rpi-gmusicproxy ``` 
