#!/bin/bash
# =============================================
# Script: server-uptime-monitor.sh
# Description: Checks if a website/server is UP or DOWN
# Author: Akshat Dubey
# Usage: ./server-uptime-monitor.sh
# =============================================

# List of URLs to monitor
URLS=(
  "https://google.com"
  "https://github.com"
  "https://aws.amazon.com"
)

LOG_FILE="uptime-log.txt"

echo "======================================"
echo "       SERVER UPTIME MONITOR"
echo "======================================"
echo "Checked at: $(date)"
echo ""

for URL in "${URLS[@]}"; do
  STATUS=$(curl -o /dev/null -s -w "%{http_code}" --max-time 5 "$URL")

  if [ "$STATUS" -eq 200 ]; then
    echo "✅ UP   | $URL (HTTP $STATUS)"
    echo "$(date) | UP | $URL | HTTP $STATUS" >> "$LOG_FILE"
  else
    echo "❌ DOWN | $URL (HTTP $STATUS)"
    echo "$(date) | DOWN | $URL | HTTP $STATUS" >> "$LOG_FILE"
  fi
done

echo ""
echo "Log saved to: $LOG_FILE"
echo "======================================"
