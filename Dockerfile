FROM <<BASECONTAINER>>
#FROM alpine:latest

MAINTAINER docker@intrepid.de

USER root
RUN passwd -l root ; \
    apk --update --upgrade --no-cache add \
    sudo \
    bash \
    gettext \
    nginx \
    openvpn \ 
    privoxy \
    runit

COPY app /app

ENV LOCAL_NETWORK= \
    OPENVPN_AUTO_CONFIG=true \
    OPENVPN_CONFIG_FILE=/config/config.ovpn \
    OPENVPN_HOST=localhost \
    OPENVPN_PASSWORD= \
    OPENVPN_PROXY_PORT=8080 \
    OPENVPN_TUNNEL_HOSTS= \
    OPENVPN_USERNAME= \
    OPENVPN_INTERFACE=eth0

CMD ["runsvdir", "/app"]
