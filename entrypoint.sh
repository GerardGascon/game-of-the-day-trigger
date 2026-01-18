#!/bin/sh
set -e

TZ="${TZ:-Europe/Madrid}"
ln -sf /usr/share/zoneinfo/$TZ /etc/localtime
echo "$TZ" > /etc/timezone

CRON_SCHEDULE="${CRON_SCHEDULE:-0 0 * * *}"
echo "$CRON_SCHEDULE /usr/src/app/trigger-workflow.sh >> /proc/1/fd/1 2>&1" | crontab -

exec /usr/sbin/crond -f -l 2
