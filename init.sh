#! /bin/bash -eu

echo "**** update uid and gid to ${PUID}:${PGID} ****"
groupmod -o -g "$PGID" SHAKUGAN
usermod -o -u "$PUID" SHAKUGAN

mkdir -p /app/.caddy
mkdir -p /app/.cache

chown -R SHAKUGAN:SHAKUGAN \
         /app \
         /app/.caddy \
         /app/.cache \
         /usr/local \
         /var/log \
         /data

chmod +x /app/caddy.sh \
         /app/rclone.sh \
         /app/aria2c.sh

echo "**** give caddy permissions to use low ports ****"
setcap cap_net_bind_service=+ep /usr/local/bin/caddy

"${@-sh}"
