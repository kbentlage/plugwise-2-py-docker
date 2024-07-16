FROM alpine:latest
MAINTAINER Kevin Bentlage <kevin@bentlage.nu>

RUN set -eux ; \
    apk add --update \
        sudo \
        bash \
        python3 \
        py3-crcmod \
        py3-paho-mqtt \
        py3-pyserial \
        rsync \
        git \
        supervisor ; \
    rm -rf /tmp/* /var/cache/apk/* ; \
    mkdir /plugwise ; \
    git clone https://github.com/gruijter/Plugwise-2-py.git /plugwise \
    ;

ADD supervisord.conf /etc/

WORKDIR /plugwise

EXPOSE 8000/tcp

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]