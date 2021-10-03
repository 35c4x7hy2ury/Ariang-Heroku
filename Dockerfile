FROM alpine:edge

LABEL AUTHOR=SHAKUGAN

WORKDIR /app

ENV RPC_SECRET=""
ENV ENABLE_AUTH=false
ENV ENABLE_RCLONE=true
ENV DOMAIN=:80
ENV ARIA2_USER=SHAKUGAN
ENV ARIA2_PWD=AliAly032230
ENV ARIA2_SSL=false
ENV ARIA2_EXTERNAL_PORT=80
ENV PUID=1000
ENV PGID=1000
ENV CADDYPATH=/app
ENV RCLONE_CONFIG=/app/conf/rclone.conf
ENV XDG_DATA_HOME=/app/.caddy/data
ENV XDG_CONFIG_HOME=/app/.caddy/config

ADD app /app/
ADD conf /app/conf
ADD Caddy /usr/local/caddy/

chmod +x install.sh
RUN ./install.sh

RUN rm ./install.sh

# folder for storing ssl keys
VOLUME /app/conf/key

# file downloading folder
VOLUME /data

EXPOSE 80 443

HEALTHCHECK --interval=1m --timeout=3s \
  CMD curl -f http://localhost || exit 1

CMD ["./start.sh"]
