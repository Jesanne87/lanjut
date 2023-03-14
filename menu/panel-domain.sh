#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
#IZIN SCRIPT
export YLW='\033[0;33m'
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
clear
echo -e ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                     \e[$box PANEL DOMAIN\e[30m                    \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "   [\e[$number 01${NC}]${YLW} • Add ID Cloudflare\e[m"
echo -e "   [\e[$number 02${NC}]${YLW} • Add Subdomain\e[m"
echo -e "   [\e[$number 03${NC}]${YLW} • Pointing IP\e[m"
echo -e ""
echo -e "              Press [ x ] To Go Main Menu "
echo -e ""
read -p "        Please Input Number  [1-3 or x] :  "  sys
echo -e ""
case $sys in
1)
cfa
;;
2)
cfd
;;
3)
cfp
;;
x)
system
;;
*)
echo "Please enter an correct number"
sleep 1
panel-domain
;;
esac
