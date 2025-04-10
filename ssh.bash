#!/bin/bash

# Variables
user='phiraphong.d'
pub_key='ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8KGEUW6tE0wVy/fsok3Ix9l78RUMnfD01sBcEKsqL/ phiraphong.d'

# Create a new user with a home directory and bash shell
useradd -s /bin/bash -m $user

# Set up SSH directory and authorized_keys file with appropriate permissions
mkdir -p /home/$user/.ssh
chmod 700 /home/$user/.ssh

# Add the public key to authorized_keys
echo $pub_key >> /home/$user/.ssh/authorized_keys
chmod 640 /home/$user/.ssh/authorized_keys

# Set ownership of the home directory to the new user
chown -R $user:$user /home/$user

# Add user to sudoers file
echo "$user   ALL=(ALL)       ALL" | tee -a /etc/sudoers

# Prompt to set password for the new user
echo "Please set a password for the user $user."
passwd $user
