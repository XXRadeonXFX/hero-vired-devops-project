#!/bin/bash

# Nginx Backup Script for Mike
DATE=$(date +%F)
BACKUP_DIR="/backups"
BACKUP_FILE="$BACKUP_DIR/nginx_backup_$DATE.tar.gz"

mkdir -p $BACKUP_DIR

tar -czf $BACKUP_FILE /etc/nginx /usr/share/nginx/html

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup FAILED for $DATE" >&2
fi
