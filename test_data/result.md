ubuntu@ip-172-31-37-70:~$ /home/ubuntu/scripts/backup_script.sh
+ SOURCE_DIR=/var/www/html
+ BACKUP_DIR=/home/ubuntu/Documents/ICT171_Backup_Project/backups
+ LOG_FILE=/home/ubuntu/Documents/ICT171_Backup_Project/backups/backup.log
+ ERROR_LOG=/home/ubuntu/Documents/ICT171_Backup_Project/backups/error.log
+ mkdir -p /home/ubuntu/Documents/ICT171_Backup_Project/backups
+ '[' '!' -d /var/www/html ']'
++ ls -A /var/www/html
+ '[' -z 'index.html
index.html.bak
test.html' ']'
++ date +%Y%m%d%H%M%S
+ now=20250528054754
+ ZIP_FILE=/home/ubuntu/Documents/ICT171_Backup_Project/backups/20250528054754_backup.zip
++ date
+ echo '[Wed May 28 05:47:54 UTC 2025] START TO BACKUP'
+ zip -rq /home/ubuntu/Documents/ICT171_Backup_Project/backups/20250528054754_backup.zip /var/www/html
+ '[' 0 -eq 0 ']'
++ date
+ echo '[Wed May 28 05:47:54 UTC 2025] SUCCESSFUL: Backup saved to /home/ubuntu/Documents/ICT171_Backup_Project/backups/20250528054754_backup.zip'
+ set +x
ubuntu@ip-172-31-37-70:~$ 