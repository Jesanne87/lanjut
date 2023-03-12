#!/bin/bash
clear -x
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
if ! command -v resolvconf >/dev/null; then
    echo "Installing resolvconf"
    sudo apt install resolvconf -y >/dev/null
fi

sleep 1
clear -x
# TEMPORARY
function menu1 () {
clear -x
sudo systemctl enable resolvconf.service > /dev/null && clear -x && sudo systemctl start resolvconf.service > /dev/nul
clear -x
read -p "KEY IN IP DNS: " ip1

echo "nameserver $ip1" > /etc/resolv.conf && systemctl start resolvconf.service
clear -x
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
system
}
# PERMANENTLY
function menu2 () {
clear -x
sudo systemctl enable resolvconf.service > /dev/null && clear -x && sudo systemctl start resolvconf.service > /dev/null
clear -x
echo " "
read -p "KEY IN IP DNS: " ip2
sudo dd if=/dev/null of=/etc/resolvconf/resolv.conf.d/head
echo "nameserver $ip2" | sudo tee /etc/resolvconf/resolv.conf.d/head
clear -x
sudo systemctl restart resolvconf.service > /dev/null 
clear -x
sudo resolvconf --enable-updates > /dev/null 
clear -x
sudo resolvconf -u > /dev/null 
clear -x
cat /etc/resolv.conf
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
system
}
# menu depan
function menu3 () {
clear -x
system
}
# MENU XRAY VMESS & VLESS
clear
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                     \e[$box DNS CHANGER\e[30m                     \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "[ Info ] \e[$below REBOOT VPS TO RETURN INITIAL DNS\e[m"
echo -e ""
echo -e " [\e[$number 01${NC}]\e[$below • INPUT DNS TEMPORARY\e[m"
echo -e " [\e[$number 02${NC}]\e[$below • INPUT DNS PERMANENTLY\e[m"
echo -e " [\e[$number 03${NC}]\e[$below • BACK TO MAIN MENU\e[m"
echo -e ""
echo -e "                [Ctrl + C] Exit From Script" | lolcat
echo -e ""
read -p  "Select From Options [ 1 - 3 ] :" num
echo -e ""
if [[ "$num" = "1" ]]; then
menu1
elif [[ "$num" = "2" ]]; then
menu2
elif [[ "$num" = "3" ]]; then
menu3
else
clear
echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
sleep 1
dns
fi
