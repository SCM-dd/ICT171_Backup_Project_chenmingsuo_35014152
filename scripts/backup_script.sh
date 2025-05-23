#！/bin/bash
set -x 
#Configuration
SOURCE_DIR="$HOME/Documents/ICT171_Backup_Project/test_data"  # Test data directory
BACKUP_DIR="$HOME/backups"    # Local backup directory
CLOUD_IP="13.237.110.154"                                    # cloud server IP
SSH_KEY="/home/deploy/.ssh/ec2-ubuntu-key"                         # SSH key path
CLOUD_USER="deploy"                     
LOG_FILE="$BACKUP_DIR/backup.log"
ERROR_LOG="$BACKUP_DIR/error.log"

# Create a backup directory
mkdir -p "$BACKUP_DIR" || { echo "[$(date)] ERROR: Failed to create backup directory" >> "$ERROR_LOG"; exit 1; }

# Get the current timestamp
now=$(date +%Y%m%d%H%M%S)
ZIP_FILE="$BACKUP_DIR/${now}_backup.zip"

# Check if source directory exists and is not empty
if [ ! -d "$SOURCE_DIR" ]; then
    echo "[$(date)] ERROR: Source directory $SOURCE_DIR does not exist" >> "$ERROR_LOG"
    exit 1
fi

# Fix: Directly zip the directory instead of its contents
echo "[$(date)] START TO BACKUP" >> "$LOG_FILE"
zip -rq "$ZIP_FILE" "$SOURCE_DIR" 2>> "$ERROR_LOG"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "[$(date)] SUCCESSFUL: $ZIP_FILE" >> "$LOG_FILE"
    
    # Upload to cloud server
    scp -i "$SSH_KEY" "$ZIP_FILE" "$CLOUD_USER@$CLOUD_IP:/home/$CLOUD_USER/"
    
    if [ $? -eq 0 ]; then
        echo "[$(date)] UPLOAD SUCCESSFUL" >> "$LOG_FILE"
    else
        echo "[$(date)] UPLOAD FAILED: CHECK SSH CONFIG" >> "$ERROR_LOG"
    fi
else
    echo "[$(date)] BACKUP FAILED: CHECK $ERROR_LOG" >> "$LOG_FILE"
fi