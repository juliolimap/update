
sudo chmod -R 777 /home/arcade/shared/frontends
sudo cp -R /home/arcade/update/attract /home/arcade/shared/frontends
sudo cp -R /home/arcade/update/mame /home/arcade/shared/configs
sudo cp -r /home/arcade/update/attract/attract /usr/local/bin
sudo cp -r /home/arcade/update/attract/attract /usr/bin
#sudo cp -r /home/arcade/update/attract/megatech_key.key /home/arcade
sudo cp -r /home/arcade/update/default.lyt /home/arcade/.qjoypad3
sudo cp -r /home/arcade/update/layout /home/arcade/.qjoypad3
sudo cp -r /home/arcade/update/MAME.lyt /home/arcade/.qjoypad3

sudo pacman -S mame --noconfirm


sudo rm -R /home/arcade/update
sudo rm -R /home/arcade/.local/share/Trash
#sudo pacman -Sy --noconfirm
sudo chmod -R 777 /home/arcade/shared/frontends/attract
sleep 6
