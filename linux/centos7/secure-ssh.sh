#secure-ssh.sh 
#author aaralik
#creates a new ssh user using $1 
#adds a public key from the local repo or curled from the remote repo 
#removes roots ability to ssh in 
echo "Script will run when you input the sudo password" 

#!/bin/bash

#Check if username is provided as a parameter 
if [ $# -ne 1 ]; then
    echo "Usage: $0 <username>" 
    exit 1
fi 

username="$1" 

# Create user with passwordless authentication 
sudo useradd -m -s /bin/bash "$username" 
sudo mkdir -p /home/"$username"/.ssh
sudo cp /home/nilufer/SYS-265/linux/public-keys/id_ed25519.pub /home/"$username"/.ssh/authorized_keys
sudo chmod 700 /home/"$username"/.ssh 
sudo chmod 600 /home/"$username"/.ssh/authorized_keys
sudo chown -R "$username:$username" /home/"$username"/.ssh

echo "Passwordless user '$username' has been created with associated private key." 
