FROM ubuntu/squid:4.13-21.10_edge

ARG PORT $PORT
ARG PROXY_USER $PROXY_USER
ARG PROXY_PASSWORD $PROXY_PASSWORD
ARG PROXY_PASSWORD_SALT $PROXY_PASSWORD_SALT

EXPOSE ${PORT}:3128

RUN echo "${PROXY_USER}:$(openssl passwd -salt ${PROXY_PASSWORD_SALT} -6 ${PROXY_PASSWORD})" > /etc/squid/htpasswd

COPY ./squid/squid.conf /etc/squid/squid.conf