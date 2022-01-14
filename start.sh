 
#sudo cp -R /home/arcade/update/retroarch /home/arcade/.config
#sudo cp -R /home/arcade/update/attract /home/arcade/shared/frontends

sudo cp -r "/home/arcade/update/config.ini" "/home/arcade/.skyscraper"
sudo cp -r "/home/arcade/update/pacman.conf" "/etc/pacman.conf"
sudo rm -r /var/lib/pacman/db.lck
sudo pacman -Sy --noconfirm
sudo pacman -S libzip --noconfirm

dialog --infobox "instalando Flycast..." 10 20 

sleep 2

sudo pacman -S fbneo --noconfirm

dialog --infobox "instalando Fbneo..." 10 20
sleep 2

sudo cp -r "/home/arcade/update/flycast" "/usr/local/bin"
sleep 2
sudo cp -r "/home/arcade/update/flycast.png" "/usr/share/pixmaps"
sleep 2
sudo cp -r "/home/arcade/update/flycast.desktop" "/usr/share/applications"
sleep 2
sudo chmod -R 777 /usr/local/bin/flycast

 
sudo cp -r "/home/arcade/update/attract/qr-to-png" "/usr/bin"
sudo mv -f "/home/arcade/update/interactive" "/opt/gasetup/core/procedures"
sleep 2
sudo chmod 777 /usr/bin/qr-to-png
sudo mkdir /home/arcade/shared/frontends/attract/bkp
sudo mkdir /home/arcade/shared/frontends/attract/bkp/attract



sudo cp -r "/home/arcade/update/attract/attract" "/usr/bin"
sudo cp -r "/home/arcade/update/attract/attract" "/usr/local/bin"
sudo cp -r "/home/arcade/update/attract/attract" "/usr/share"

#sudo cp -r "/home/arcade/update/splash.png" /usr/share/plymouth/themes/groovy
#sudo plymouth-set-default-theme -R groovy
 
sudo rm -R /home/arcade/update
sudo rm -R /home/arcade/.local/share/Trash
sudo pacman -Sy --noconfirm
#sudo chmod -R 777 /home/arcade/shared/frontends/attract
dialog --infobox "Reiniciando..." 10 20 
sleep 3 
clear
reboot
