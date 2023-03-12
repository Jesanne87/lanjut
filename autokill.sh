#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# // LINE COLOUR
export line=$(cat /etc/line)
# NUMBER COLOUR
number=$(cat /etc/number)
# Valid Script
# TEXT COLOUR BELOW
below=$(cat /etc/below)
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e ""
echo -e "\e[$line•──────────────────────────────────────•\e[m"
echo -e ""
echo -e "     Status Autokill $sts        "
echo -e ""
echo -e "     [\e[$number 01${NC}]\e[$below • AutoKill After 5 Minutes\e[m"
echo -e "     [\e[$number 02${NC}]\e[$below • AutoKill After 10 Minutes\e[m"
echo -e "     [\e[$number 03${NC}]\e[$below • AutoKill After 15 Minutes\e[m"
echo -e "     [\e[$number 04${NC}]\e[$below • Turn Off AutoKill/MultiLogin\e[m"
echo -e "     [\e[$number 00${NC}]\e[$below • Exit\e[m"
echo -e "\e[$line•──────────────────────────────────────•\e[m"                                                                                                          
echo -e ""
read -p "     Select From Options [1-4 or 0] :  " AutoKill
read -p "     Multilogin Maximum Number Of Allowed: " max
echo -e ""
case $AutoKill in
                1)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────•\e[m"
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoKill Every     : 5 Minutes"      
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────•\e[m"                                                                                                                                 
                ssh                                                                  
                ;;
                2)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "\e[$line•────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoKill Every     : 10 Minutes"
                echo -e ""
                echo -e "\e[$line•────────────────────────────────────•\e[m"
                ssh
                ;;
                3)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/15 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "\e[$line•────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoKill Every     : 15 Minutes"
                echo -e ""
                echo -e "\e[$line•────────────────────────────────────•\e[m"
                ssh
                ;;
                4)
                clear
                echo > /etc/cron.d/tendang
                echo -e ""
                echo -e "\e[$line•────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "      AutoKill MultiLogin Turned Off  "
                echo -e ""
                echo -e "\e[$line•────────────────────────────────────•\e[m"
                ssh
                ;;
                0)
                clear
                ssh
                ;;
        esac
