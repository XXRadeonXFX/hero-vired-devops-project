#!/bin/bash

LOG_DIR="/var/log/system_monitoring"
PROCESS_LOG="$LOG_DIR/process_usage_$(date +%Y-%m-%d).log"

# Create log directory if it doesn't exist
mkdir -p $LOG_DIR

# Log timestamp
echo "=== Process Usage Report $(date) ===" >> $PROCESS_LOG

# Top 10 CPU-intensive processes
echo "Top CPU-Intensive Processes:" >> $PROCESS_LOG
ps aux --sort=-%cpu | head -11 >> $PROCESS_LOG
echo "" >> $PROCESS_LOG

# Top 10 memory-intensive processes
echo "Top Memory-Intensive Processes:" >> $PROCESS_LOG
ps aux --sort=-%mem | head -11 >> $PROCESS_LOG
