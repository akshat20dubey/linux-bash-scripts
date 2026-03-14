#!/bin/bash
# =============================================
# Script: system-health-check.sh
# Description: Checks CPU, Memory, and Disk usage
# Author: Akshat Dubey
# =============================================

echo "======================================"
echo "       SYSTEM HEALTH REPORT"
echo "======================================"
echo "Date: $(date)"
echo ""

# CPU Usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
echo "CPU Usage     : $CPU%"

# Memory Usage
TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')
USED_MEM=$(free -m | awk '/Mem:/ {print $3}')
MEM_PERCENT=$(awk "BEGIN {printf \"%.1f\", ($USED_MEM/$TOTAL_MEM)*100}")
echo "Memory Usage  : ${USED_MEM}MB / ${TOTAL_MEM}MB (${MEM_PERCENT}%)"

# Disk Usage
DISK=$(df -h / | awk 'NR==2 {print $5}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
echo "Disk Usage    : ${DISK_USED} / ${DISK_TOTAL} (${DISK})"

echo ""
echo "======================================"

# Alerts
if (( $(echo "$CPU > 80" | bc -l) )); then
  echo "⚠️  ALERT: High CPU usage detected!"
fi

MEM_INT=${MEM_PERCENT%.*}
if [ "$MEM_INT" -gt 80 ]; then
  echo "⚠️  ALERT: High Memory usage detected!"
fi

DISK_INT=${DISK%\%}
if [ "$DISK_INT" -gt 80 ]; then
  echo "⚠️  ALERT: Low Disk space!"
fi

echo "======================================"
