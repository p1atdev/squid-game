FROM ubuntu/squid:4.13-21.10_edge

# RUN htpasswd -c -b /etc/squid/htpasswd $USER $PASSWORD

# ARG PROXY_USER $PROXY_USER
# ARG PROXY_PASSWORD $PROXY_PASSWORD
# ARG PROXY_PASSWORD_SALT $PROXY_PASSWORD_SALT

# RUN apt-get update && apt-get install -y squid

# RUN echo "${PROXY_USER}:$(openssl passwd -salt ${PROXY_PASSWORD_SALT} -6 ${PROXY_PASSWORD})" > /etc/squid/htpasswd

# RUN echo "${PROXY_USER}:$(openssl passwd -apr1 ${PROXY_PASSWORD})" > /etc/squid/htpasswd
# RUN htpasswd -bc /etc/squid/htpasswd $PROXY_USER $PROXY_PASSWORD

COPY ./squid/squid.conf /etc/squid/squid.conf
# RUN chmod 644 /etc/squid/squid.conf

# start squid
# CMD ["squid", "-N", "-f", "/etc/squid/squid.conf"]