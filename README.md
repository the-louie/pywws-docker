# pywws-docker
[Docker Hub](https://hub.docker.com/r/thelouie/pywws-docker/)

Provides a Docker image for pywws. Find out more about pywws here: https://github.com/jim-easterbrook/pywws

Fork from [duckfullstop](https://hub.docker.com/r/duckfullstop/pywws-docker/)s docker image to add dependencies for MQTT

Based on Alpine Linux, which provides far leaner images (sub-100mb!)

Use `--privileged` to give access to USB devices (you should also be able to directly pipe your weather station's HID device into the container with `--device`, but it's untested!)

To run:
`docker run -–privileged -v ~/weather:/var/weather thelouie/pywws-docker`

For docker compose
```yml
version: '3'
services:
  pywws:
    container_name: "pywws"
    image: "thelouie/pywws-docker"
    restart: always
    environment:
      - TZ=CET
    volumes:
      - ./weather:/var/weather
    network_mode: host
    privileged: true
```
