#!/bin/bash
# =============================================
# Script: log-analyzer.sh
# Description: Scans a log file and extracts ERROR and WARNING lines
# Author: Akshat Dubey
# Usage: ./log-analyzer.sh /path/to/logfile.log
# =============================================

LOG_FILE=$1

# Check if file was provided
if [ -z "$LOG_FILE" ]; then
  echo "Usage: ./log-analyzer.sh /path/to/logfile.log"
  exit 1
fi

# Check if file exists
if [ ! -f "$LOG_FILE" ]; then
  echo "❌ File not found: $LOG_FILE"
  exit 1
fi

echo "======================================"
echo "         LOG FILE ANALYZER"
echo "======================================"
echo "File    : $LOG_FILE"
echo "Scanned : $(date)"
echo ""

ERROR_COUNT=$(grep -ic "error" "$LOG_FILE")
WARN_COUNT=$(grep -ic "warning" "$LOG_FILE")
TOTAL_LINES=$(wc -l < "$LOG_FILE")

echo "Total Lines : $TOTAL_LINES"
echo "Errors      : $ERROR_COUNT"
echo "Warnings    : $WARN_COUNT"
echo ""

echo "======================================"
echo "         ERROR LINES FOUND:"
echo "======================================"
grep -i "error" "$LOG_FILE" | head -20

echo ""
echo "======================================"
echo "         WARNING LINES FOUND:"
echo "======================================"
grep -i "warning" "$LOG_FILE" | head -20

echo ""
echo "======================================"
echo "Analysis complete!"
