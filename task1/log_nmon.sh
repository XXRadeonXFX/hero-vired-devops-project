#!/bin/bash
# Log system performance data using nmon

nmon -f -s 10 -c 6 -F /var/log/system_monitoring/nmon_snapshot_$(date +%F_%H-%M).nmon
