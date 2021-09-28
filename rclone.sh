#! /bin/bash -eu

if [ "$ENABLE_RCLONE" = "true" ]; then
  echo "Start Rclone, please make sure you can connect to Github website. if not, please set docker env ENABLE_RCLONE=false"
  /usr/bin/rclone --conf-path="/app/conf/rclone.conf" \
  rclone rcd --rc-web-gui \
    --rc-web-gui-no-open-browser \
    --rc-addr :5572 \
    --rc-user $ARIA2_USER \
    --rc-pass $ARIA2_PWD \
    --cache-dir /app/.cache
else
  echo "Start aria2 with standard mode" 
  /usr/bin/rclone --conf-path="/app/conf/rclone.conf"
  echo "Skip starting Rclone as it's been disabled"
  sleep 3650d
fi
