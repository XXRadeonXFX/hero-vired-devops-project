#!/bin/bash

LOG_DIR="/var/log/system_monitoring"
DISK_LOG="$LOG_DIR/disk_usage_$(date +%Y-%m-%d).log"

# Create log directory if it doesn't exist
mkdir -p $LOG_DIR

# Log timestamp
echo "=== Disk Usage Report $(date) ===" >> $DISK_LOG

# Overall disk usage
echo "Overall Disk Usage:" >> $DISK_LOG
df -h >> $DISK_LOG
echo "" >> $DISK_LOG

# Top 10 directories by size
echo "Top 10 Directories by Size:" >> $DISK_LOG
du -h /home | sort -rh | head -10 >> $DISK_LOG
