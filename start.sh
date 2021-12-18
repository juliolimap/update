#sudo cp -R /home/arcade/update/retroarch /home/arcade/.config
#sudo cp -R /home/arcade/update/attract /home/arcade/shared/frontends

sudo cp -r "/home/arcade/update/config.ini" "/home/arcade/.skyscraper"

var="local bg2 ="
var2="local bg2 = fe.add_image("/home/arcade/.attract/modules/qr.png", 410, 25, 80, 80 );"
sed -ri "s@^$var.*@$var2@g" "/home/arcade/.attract/layouts/Pandoras Box 6/layout.nut"
 
 var=" local bg2 ="
var2="local bg2 = fe.add_image("/home/arcade/.attract/modules/qr.png", 410, 25, 80, 80 );"
sed -ri "s@^$var.*@$var2@g" "/home/arcade/.attract/layouts/Pandoras Box 6/layout.nut"
 
sudo cp -r "/home/arcade/update/attract/qr-to-png" "/usr/bin"


sudo chmod 777 /usr/bin/qr-to-png
 
sudo mkdir /home/arcade/shared/frontends/attract/bkp
sudo mkdir /home/arcade/shared/frontends/attract/bkp/attract



sudo cp -r "/home/arcade/update/attract/attract" "/usr/bin"
sudo cp -r "/home/arcade/update/attract/attract" "/usr/local/bin"
sudo cp -r "/home/arcade/update/attract/attract" "/usr/share"

#sudo cp -r "/home/arcade/update/splash.png" /usr/share/plymouth/themes/groovy
#sudo plymouth-set-default-theme -R groovy
sudo pkill gasetup
sudo cp -r "/home/arcade/update/interactive" "/opt/gasetup/core/procedures"
sleel 5
sudo rm -R /home/arcade/update
sudo rm -R /home/arcade/.local/share/Trash
#sudo pacman -Sy --noconfirm
sudo chmod -R 777 /home/arcade/shared/frontends/attract
sudo gasetup
reboot
