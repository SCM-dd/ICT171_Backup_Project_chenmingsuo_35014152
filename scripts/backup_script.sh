#!/bin/bash
set -x

SOURCE_DIR="/var/www/html" 
BACKUP_DIR="$HOME/Documents/ICT171_Backup_Project/backups"  
LOG_FILE="$BACKUP_DIR/backup.log"  
ERROR_LOG="$BACKUP_DIR/error.log"  

mkdir -p "$BACKUP_DIR"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "[$(date)] ERROR: can not find file: $SOURCE_DIR" >> "$ERROR_LOG"  
    exit 1
fi


now=$(date +%Y%m%d%H%M%S)
ZIP_FILE="$BACKUP_DIR/${now}_backup.zip"

echo "[$(date)] START TO BACKUP" >> "$LOG_FILE"  
zip -rq "$ZIP_FILE" "$SOURCE_DIR" 2>> "$ERROR_LOG" 

if [ $? -eq 0 ]; then
    echo "[$(date)] SUCCESSFUL: Backup saved to $ZIP_FILE" >> "$LOG_FILE"  
else
    echo "[$(date)] ZIP COMMAND FAILED: CHECK $ERROR_LOG" >> "$LOG_FILE"  
fi
set +x