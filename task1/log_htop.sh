#!/bin/bash
# Log output similar to htop using top command

echo "HTOP (TOP) Output - $(date)" > /var/log/system_monitoring/htop_snapshot.log
top -b -n 1 | head -40 >> /var/log/system_monitoring/htop_snapshot.log
