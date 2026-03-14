#!/bin/bash
# =============================================
# Script: backup.sh
# Description: Backs up a folder with a timestamp
# Author: Akshat Dubey
# Usage: ./backup.sh /path/to/source /path/to/backup-destination
# =============================================

SOURCE=$1
DEST=$2
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# Check arguments
if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
  echo "Usage: ./backup.sh /source/folder /destination/folder"
  exit 1
fi

# Check if source exists
if [ ! -d "$SOURCE" ]; then
  echo "❌ Source folder not found: $SOURCE"
  exit 1
fi

# Create destination if it doesn't exist
mkdir -p "$DEST"

echo "======================================"
echo "           BACKUP UTILITY"
echo "======================================"
echo "Source      : $SOURCE"
echo "Destination : $DEST/$BACKUP_NAME"
echo "Started at  : $(date)"
echo ""

# Run backup
tar -czf "$DEST/$BACKUP_NAME" "$SOURCE"

if [ $? -eq 0 ]; then
  SIZE=$(du -sh "$DEST/$BACKUP_NAME" | cut -f1)
  echo "✅ Backup successful!"
  echo "File: $DEST/$BACKUP_NAME"
  echo "Size: $SIZE"
else
  echo "❌ Backup failed!"
  exit 1
fi

echo "======================================"
