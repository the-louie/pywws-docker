FROM alpine:latest
LABEL maintainer "Louie <docker@louie.se>"

RUN apk add --no-cache python3 \
    py3-pip \
    libusb \
    py3-cffi \
    openssl \
    libc-dev \
    ca-certificates \
    python3-dev \
    py3-pytest \
    gcc \
    py3-cryptography \
    py3-paramiko \
    gnuplot \
    && update-ca-certificates

RUN pip3 install --upgrade pip
RUN pip3 install \
    libusb1 \
    python-twitter \
    oauth2 \
    tzlocal \
    pycrypto \
    paho-mqtt \
    requests \
    pywws

VOLUME ["/var/weather"]
ENTRYPOINT ["pywws-livelog", "/var/weather/data"]
