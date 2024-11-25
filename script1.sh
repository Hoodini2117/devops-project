#!/bin/bash

LOG_FILE="/var/log/script1.log"

# Disk Utilization Monitoring
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | cut -d'%' -f1)
if [ "$DISK_USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is above 80% ($DISK_USAGE%)"
    exit 1
else
    echo "Disk usage is normal: $DISK_USAGE%"
fi

# Process Management
echo "Top 5 CPU consuming processes:"
ps aux --sort=-%cpu | head -6
echo -e "\nTop 5 memory consuming processes:"
ps aux --sort=-%mem | head -6
echo -e "\nZombie processes:"
ps aux | awk '$8=="Z" {print}'

echo "All tasks completed." | tee -a "$LOG_FILE"
