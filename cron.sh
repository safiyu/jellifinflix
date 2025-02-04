#!/bin/sh
figlet -w 120 -l Jellyfin_Fix
echo "Server started at $(date)"
echo "Running cron job $CRON_STRING"

echo "$CRON_STRING  sh /app/entry.sh" > /app/crontab
crontab /app/crontab

cat /app/crontab
# start cron
/usr/sbin/crond -f -l 8
