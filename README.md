# Gpi scripts

These xboxdrv controller scripts greatly enhance the capabilities of your Gpi Case.  They can provide many virtual buttons using a button as a modifier.  (In effect, it can turn the six button control scheme into a 12 button one!)

# To migrate to the new framework or to install the scripts for the first time:

## Update/install the menu

```shell
cd && cd RetroPie/retropiemenu && wget -O control_updater_menu.sh  https://raw.githubusercontent.com/SinisterSpatula/Gpi/master/control_updater_menu.sh && sudo chmod 775 control_updater_menu.sh
```

## Then run this command

```shell
 sudo /home/pi/RetroPie/retropiemenu/control_updater_menu.sh
```
## choose Update Controls Framework, then exit.

## Retart Emulationstation

### Done.

You also need to have xboxdrv installed (if it isn't already).  [See the Guide here](https://sinisterspatula.github.io/SuperRetropieGuides/Controls_Updater_Menu)

## Additional Resources

* The newest source code of this project [is located here](https://github.com/SinisterSpatula/Gpi2/)

## See also

* [Our guide located here](https://sinisterspatula.github.io/SuperRetropieGuides/Controls_Updater_Menu)
