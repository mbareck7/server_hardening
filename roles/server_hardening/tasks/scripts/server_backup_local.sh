#!/bin/bash

#backup paths, folders & files
folders=("/var/log")
files=("/etc/fail2ban/jail.local" "/etc/ssh/ssh_config" "/etc/ssh/sshd_config")

cdate=$(date +%F:%T) #current date
if [ ! -f /usr/bin/rsync ]; then
        sudo apt install -y rsync
fi

#local backup, backup config and data into ~/backup/ folder
#backup files
for file_ in "${files[@]}";do
 rsync -vuzar $file_ ~/backup/
done


#backup folders
for folder_ in "${folders[@]}";do
 rsync -vuzar $folder_ ~/backup/
done