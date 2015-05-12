#!/bin/bash
#Backup script Final Version - Network backup with ssh and tar
#ssh 192.168.80.141 "tar zcf - /home/sumit/NP" > /tmp/backup/rhel5/ubuntu_np.tgz
#This script works on following assumption
# 1 Centralized server(RHEL 6) and it has passwordless SSH login on other systems(Any machine of the network )
# Central Server copies file from remote machine and backs up in central server

#enter the ip
echo "Enter the remote system IP:"
read ip

#select what to backup in remote system
echo "Select the files you want to backup"
read backup_files

#where to backup
mkdir -p /tmp/backup
dest="/tmp/backup"

#Create filename
day=$(date +%d%m%Y)
hostname=$(hostname -s)
archive_file="$hostname-$ip-$day.tgz"

# Print start status message.
echo "Backing up $ip/$backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
#tar czf $dest/$archive_file $backup_files
ssh $ip "tar zcf - $backup_files" > $dest/$archive_file

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest

