#!/bin/bash
#run this scirpt as root

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

#OS
echo -e "*****************************System INFO*****************************"
cat /etc/*-release

#Kernel
echo -e "\n\n\n*****************************Kernel INFO*****************************"
echo Name: `uname -s` 
echo Release: `uname -r` 
echo Version: `uname -v`

#Hardware
echo -e "\n\n\n*****************************Hardware INFO*****************************"
echo Architecture: `uname -m`
echo -e "\n ${RED}lshw -short output${NC}"
lshw -short | head -n 41 #lshw output

#cpu
echo -e "\n\n\n*****************************CPU INFO*****************************"
echo -e "\n ${RED}lscpu | head -n 20 output${NC}"
lscpu | head -n 20

#disk
echo -e "\n\n\n*****************************Disk INFO*****************************"
echo -e "\n ${RED}lsblk | grep -v -e  \"loop\|kubernetes\" output${NC}"
lsblk | grep -v -e  "loop\|kubernetes"