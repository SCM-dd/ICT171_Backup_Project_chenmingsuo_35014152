1. key settings for ssh
    - public key autherticaton
        mkdir -p ~/.ssh  (make .ssh directory)    
        chmod 700 ~/.ssh (change permission just for owern can read and write and ecxute)
    - add the public key to the server
        echo "public key pair" >> ~/.ssh/authorized_keys (add the public key to the server)
        chmod 600 ~/.ssh/authorized_keys (change permission just for owern can read and write)
2. ssh config
    - add the ssh config to the server
        sudo nano /etc/ssh/sshd_config(Edit the configuration file)
            PubkeyAuthentication yes (Enable public key authentication)
            PasswordAuthentication no (Disable password authentication)
        sudo systemctl restart ssh (Restart the ssh service)
        - add the ssh config to the client
3. manage the key pair
    - ls -l /home/deploy/.ssh/ec2-ubuntu-key
    - ls -l /home/ubuntu/.ssh/ec2-ubuntu-key
4. common error handling
    - can not login by via public key
        - check the permission of the key pair
          the file permission should be 600
        - check the permission of the authorized_keys
    - can not restart the ssh service
        - check the gramma of the sshd_config
           use sudo sshd -t to check the gramma of the sshd_config


OpenBSD. (n.d.). sshd_config.5 - OpenSSH Server Configuration. https://man.openbsd.org/sshd_config.5
Kenlon, S. (2018, January 22). How to Configure SSH Key - Based Authentication on a Linux Server. DigitalOcean. https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server
   
        
