#!/bin/bash
#=============================================================================
#title:         menu.sh
#description:   Menu which allows multiple items to be selected, for the Controls for the GPi
#author:        Crash
#created:       June 24 2019
#updated:       N/A
#version:       1.0
#usage:         ./menu.sh
#==============================================================================
export NCURSES_NO_UTF8_ACS=1
#IFS=';'

# Welcome
 #dialog --backtitle "GPi Controls MENU" --title "The Gpi Controls Menu Utility" \
 #   --yesno "\nDo you want to proceed?" \
 #   28 110 2>&1 > /dev/tty \
 #   || exit

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \
            1 "Update Controls Framework" \
            2 "System Reboot" \
            3 "System Shutdown" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) update_controls  ;;
            2) system_reboot  ;;
            3) system_shutdown  ;;
            *)  break ;;
        esac
    done
}

######################
# Functions for menu #
######################

function validate_url(){
  if [[ `wget -S --spider $1  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    return 0
  else
    return 1
  fi
}

function update_controls() {
if validate_url https://raw.githubusercontent.com/SinisterSpatula/Gpi2/master/xboxdrvstart.sh; then
cd
cd /opt/retropie/configs/all
sudo wget -O runcommand-onend.sh https://raw.githubusercontent.com/SinisterSpatula/Gpi2/master/runcommand-onend.sh
sudo wget -O runcommand-onstart.sh https://raw.githubusercontent.com/SinisterSpatula/Gpi2/master/runcommand-onstart.sh
sudo chmod a+x *.sh
cd
cd /opt/retropie/supplementary/xboxdrv/bin
sudo wget -O quit.sh https://raw.githubusercontent.com/SinisterSpatula/Gpi2/master/quit.sh
sudo chmod a+x quit.sh
sudo mkdir -p ~/RetroPie/retropiemenu/Controllertools
cd
cd ~/RetroPie/retropiemenu/Controllertools
sudo wget -O control_updater_menu.sh https://raw.githubusercontent.com/SinisterSpatula/Gpi2/master/control_updater_menu.sh
sudo chmod 775 control_updater_menu.sh
sudo rm ~/RetroPie/retropiemenu/control_updater_menu.sh
echo "-------------------------------------"
echo "|Migrated to new Controls Framework.|"
echo "|  Relaunch again and update again  |"
echo "|  !!!Please do the update again!!! |"
echo "| updater is now in controllertools |"
echo "-------------------------------------"
sleep 60s
  else
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo ".                                      ."
    echo ".FAILED! File not available or wifi off."
    echo ".                                      ."
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    sleep 10s
fi
}

function launch_commandline() {
break
}

function system_shutdown() {
sudo shutdown -P now
}

function system_reboot() {
sudo reboot
}


# Main

main_menu
