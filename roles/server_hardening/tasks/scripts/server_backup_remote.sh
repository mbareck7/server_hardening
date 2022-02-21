#!/bin/bash

bk_server=$1 #backup server ip, passed through the cron job.
bk_server_ssh_port=$4
user=$2

#this script work on data provided by server_backup_local.sh script

#backup_dir=/absolute/path/to/server_local_backup
backup_dir=$3

#remote_backup_dir=/path/to/backup/destinaion/on/remote/server
remote_backup_dir=$5
incremental_dir=~/backup_trush #to preserve a copy of delete file from backup

rsync -vbuzar --backup-dir=$incremental_dir/`date +%F:%T` -e "ssh -p${bk_server_ssh_port}" $backup_dir $user@$bk_server:$remote_backup_dir --delete


#backup policy, we keep a remote folder sync to server local backup dir,
#when files are deleted from local backup dir, they will be remove from main remote backup dir,
#but they are backup to an other folder named by the date and time of last update date and time.
#deleted files are keept in incremental_dir