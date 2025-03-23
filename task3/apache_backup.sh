#!/bin/bash

# Apache Backup Script
# Backs up Apache config and web root

DATE=$(date +%F)  # Format: YYYY-MM-DD
BACKUP_DIR="/backups"
BACKUP_FILE="$BACKUP_DIR/apache_backup_$DATE.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Perform the backup
tar -czf $BACKUP_FILE /etc/apache2 /var/www/html

# Log result
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup FAILED for $DATE" >&2
fi

