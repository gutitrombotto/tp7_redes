FROM alpine:3.5
RUN apk add --update --no-progress dhclient && dhclient eth0 && cat /etc/resolv.conf.dhclient > /etc/resolv.conf && /bin/sh

