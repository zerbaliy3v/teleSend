#!/bin/bash

DATE=$(date +"%m-%d-%y")

######################### Colours ############################
RED=$(echo -e "\033[1;31m")
GREEN=$(echo -e "\033[1;32m")
RST=$(echo -e "\033[0m") 

######################## Banner ##############################
echo "_____________________________________"
echo "          ${RED}File Sender Bot{RST} "
echo " "
echo "          ${GREEN} DATE:$DATE ${STD}"
echo "_____________________________________"
echo " "

######################## BOT INFO ############################
chatId=<chatId>
botToken=<You Bot Token>

####################### Send #################################
curdir=$PWD

echo sending $curdir/$1

message=$2

curl -F chat_id=$chatId -F document=@$curdir/$1 -F caption=$DATE https://api.telegram.org/bot$botToken/sendDocument && curl -s -X POST "https://api.telegram.org/bot$botToken/sendMessage" -d "chat_id=$chatId" -d text="$message"
