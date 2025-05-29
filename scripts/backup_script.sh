#!/bin/bash
set -x
# Configuration
SOURCE_DIR="/var/www/html" 
BACKUP_DIR="$HOME/Documents/ICT171_Backup_Project/backups"  
LOG_FILE="$BACKUP_DIR/backup.log"  
ERROR_LOG="$BACKUP_DIR/error.log"  

# 创建备份目录
mkdir -p "$BACKUP_DIR"

# 检查源目录是否存在
if [ ! -d "$SOURCE_DIR" ]; then
    echo "[$(date)] ERROR: can not find file: $SOURCE_DIR" >> "$ERROR_LOG"  
    exit 1
fi


# 获取当前时间戳
now=$(date +%Y%m%d%H%M%S)
ZIP_FILE="$BACKUP_DIR/${now}_backup.zip"

# 执行备份压缩
echo "[$(date)] START TO BACKUP" >> "$LOG_FILE"  
zip -rq "$ZIP_FILE" "$SOURCE_DIR" 2>> "$ERROR_LOG" 

# 检查备份是否成功
if [ $? -eq 0 ]; then
    echo "[$(date)] SUCCESSFUL: Backup saved to $ZIP_FILE" >> "$LOG_FILE"  
else
    echo "[$(date)] ZIP COMMAND FAILED: CHECK $ERROR_LOG" >> "$LOG_FILE"  
fi
set +x