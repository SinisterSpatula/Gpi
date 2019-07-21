# Gpi scripts

This repository is outdated, please  see the new repository here: https://github.com/SinisterSpatula/Gpi2/

# To migrate to the new framework

## Update the menu

```shell
cd && cd RetroPie/retropiemenu && wget -O control_updater_menu.sh  https://raw.githubusercontent.com/SinisterSpatula/Gpi/master/control_updater_menu.sh && sudo chmod 775 control_updater_menu.sh
```

## Then run this command and pick "Update Framework"

```shell
 sudo /home/pi/RetroPie/retropiemenu/control_updater_menu.sh update_controls
```
