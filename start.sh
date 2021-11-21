#sudo cp -R /home/arcade/update/retroarch /home/arcade/.config
sudo cp -R /home/arcade/update/attract /home/arcade/shared/frontends



sudo sed -i -e '$a local bg2 = fe.add_image("/home/arcade/.attract/modules/qr.png", 420, 31, 70, 70 );/g' "/home/arcade/.attract/layouts/Pandoras Box 6/layout.nut"

sudo cp -r "/home/arcade/update/attract/qr-to-png" /usr/bin
sudo chmod -r /usr/bin/qr-to-png




#sudo cp -r "/home/arcade/update/megatech.ini" /home/arcade/.attract
#sudo cp -r "/home/arcade/update/premio.png" /home/arcade/.attract/joytokey


sudo cp -r "/home/arcade/update/interactive" /opt/gasetup/core/procedures
sudo cp -r "/home/arcade/update/attract/attract" /usr/bin
sudo cp -r "/home/arcade/update/attract/attract" /usr/local/bin
sudo cp -r "/home/arcade/update/attract/attract" /usr/share

#sudo cp -r "/home/arcade/update/splash.png" /usr/share/plymouth/themes/groovy
#sudo plymouth-set-default-theme -R groovy

sudo rm -R /home/arcade/update
sudo rm -R /home/arcade/.local/share/Trash
#sudo pacman -Sy --noconfirm
sudo chmod -R 777 /home/arcade/shared/frontends/attract
