+ SOURCE_DIR=/var/www/html
+ BACKUP_DIR=/home/deploy/backups
+ CLOUD_IP=13.237.110.154
+ SSH_KEY=/home/deploy/.ssh/ec2-ubuntu-key
+ CLOUD_USER=deploy
+ LOG_FILE=/home/deploy/backups/backup.log
+ ERROR_LOG=/home/deploy/backups/error.log
+ mkdir -p /home/deploy/backups
++ date +%Y%m%d%H%M%S
+ now=20250524122218
+ ZIP_FILE=/home/deploy/backups/20250524122218_backup.zip
+ '[' '!' -d /var/www/html ']'
++ date
+ echo '[Sat May 24 12:22:18 UTC 2025] START TO BACKUP'
+ zip -rq /home/deploy/backups/20250524122218_backup.zip /var/www/html
+ '[' 0 -eq 0 ']'
++ date
+ echo '[Sat May 24 12:22:18 UTC 2025] SUCCESSFUL: /home/deploy/backups/20250524122218_backup.zip'
+ scp -i /home/deploy/.ssh/ec2-ubuntu-key /home/deploy/backups/20250524122218_backup.zip deploy@13.237.110.154:/home/deploy/
Enter passphrase for key '/home/deploy/.ssh/ec2-ubuntu-key': 
20250524122218_backup.zip                                                                                                                                  100% 4670     7.0MB/s   00:00    
+ '[' 0 -eq 0 ']'
++ date
+ echo '[Sat May 24 12:22:24 UTC 2025] UPLOAD SUCCESSFUL'
deploy@ip-172-31-37-70:/home/ubuntu$ 
