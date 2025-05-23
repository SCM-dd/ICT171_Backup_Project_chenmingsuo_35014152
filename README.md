#ICT 171 assignment: project: Build a personal website and configure automatic backup

## Project inttruction;
###1. use AWS EC2 to build a personal website use ufw to setup the firewall
-Access the website via public IP (HTTP port 80)
-Backup the website files automatically to a to the specified directory.

## Technology Stack: 
online server: AWS EC2 t3.micro 
web server: Apache2
firewall: ufw
backup: bash
identity authentication: ssh ed25519 key pair 

## repository file description:
- index.html: the website content
- backup_script.sh: bash script to backup the website files
  -**funcation**:
  Compress the website directory to `/home/ubuntu/backups/` every day
- ufw_script.md: bash script to setup the firewall
- README.md: project instruction





