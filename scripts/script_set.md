**uplaod the script to the server**
1)	scp -i ~/.ssh/ec2-ubuntu-key.pem ~/Documents/ICT171_Backup_Project/backup_script.sh ubuntu@13.237.110.154:~/scripts/
scp -i ~/.ssh/your_key_pair.pem ~your_script_location serve_username@ip:~/scripts/
**check the script**
2) ls -l ~/scripts/backup_script.sh
**move the script to the system executable dircetory**
sudo mv ~/scripts/backup_script.sh /usr/local/bin/backup_script.sh
**change the permission of the script**
3) chmod +x ~/scripts/backup_script.sh
**check the script**
4) ls -l ~/scripts/backup_script.sh
**run the script**
5) ~/scripts/backup_script.sh
**Scheduled task configuration**
6) crontab -e
**add the script to the crontab**
7) 0 * * * * ~/scripts/backup_script.sh
**check the crontab**
8) crontab -l



