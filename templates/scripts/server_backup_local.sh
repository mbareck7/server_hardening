#!/bin/bash


local_backup_folder=$1

#backup paths, folders & files
folders=("/var/log" "some/other/folder")
files=("/etc/fail2ban/jail.local" "/some/other/file")

cdate=$(date +%F:%T) #current date
if [ ! -f /usr/bin/rsync ]; then
        sudo apt install -y rsync
fi

#local backup, backup config and data into ~/backup/ folder
#backup files
for file_ in "${files[@]}";do
 rsync -vuzar $file_ $local_backup_folder
done


#backup folders
for folder_ in "${folders[@]}";do
 rsync -vuzar $folder_ $local_backup_folder
done